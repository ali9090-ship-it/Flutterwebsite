package com.mohdali.portfolio.ui

import android.content.Intent
import android.net.Uri
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

// ====== EDIT YOUR DETAILS HERE ======
private const val NAME = "Mohd Ali Ansari"
private const val ROLE = "Data Analyst & AI/ML"
private const val TAGLINE =
    "I turn messy data into clear decisions and build machine learning models that ship."
private const val ABOUT =
    "I am a data analyst focused on analytics, visualization and machine learning. " +
    "I enjoy cleaning data, finding patterns, and turning them into dashboards and models " +
    "that people can actually use."
private const val EMAIL = "youremail@example.com"
private const val GITHUB = "https://github.com/yourusername"
private const val LINKEDIN = "https://linkedin.com/in/yourusername"

private val skills = listOf(
    "Python", "SQL", "Pandas", "NumPy", "Scikit-learn", "TensorFlow",
    "Power BI", "Tableau", "Excel", "Statistics", "Flutter", "Kotlin"
)

private data class Project(
    val title: String,
    val description: String,
    val tags: List<String>,
    val link: String = ""
)

private val projects = listOf(
    Project("Sales Dashboard",
        "Interactive Power BI dashboard tracking revenue, regions and trends.",
        listOf("Power BI", "SQL")),
    Project("Churn Prediction",
        "ML model that predicts customer churn with feature engineering and tuning.",
        listOf("Python", "Scikit-learn")),
    Project("Sentiment Analysis",
        "NLP pipeline that classifies reviews as positive, neutral or negative.",
        listOf("Python", "TensorFlow"))
)
// =====================================

@OptIn(ExperimentalLayoutApi::class)
@Composable
fun PortfolioScreen() {
    val context = LocalContext.current
    fun open(url: String) =
        context.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))

    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .background(Bg)
            .statusBarsPadding(),
        contentPadding = PaddingValues(24.dp),
        verticalArrangement = Arrangement.spacedBy(28.dp)
    ) {
        item {
            Column(verticalArrangement = Arrangement.spacedBy(10.dp)) {
                Spacer(Modifier.height(24.dp))
                Text(NAME, fontSize = 38.sp, fontWeight = FontWeight.Bold, lineHeight = 42.sp)
                Text(ROLE, fontSize = 20.sp, color = Accent)
                Text(TAGLINE, fontSize = 16.sp, color = Muted, lineHeight = 24.sp)
                Spacer(Modifier.height(6.dp))
                Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                    Button(
                        onClick = { open("mailto:$EMAIL") },
                        colors = ButtonDefaults.buttonColors(containerColor = Accent, contentColor = Bg)
                    ) { Text("Contact me") }
                    OutlinedButton(
                        onClick = { open(GITHUB) },
                        border = BorderStroke(1.dp, Accent),
                        colors = ButtonDefaults.outlinedButtonColors(contentColor = Accent)
                    ) { Text("View GitHub") }
                }
            }
        }

        item { SectionTitle("About") }
        item { Text(ABOUT, color = Muted, fontSize = 16.sp, lineHeight = 26.sp) }

        item { SectionTitle("Skills") }
        item {
            FlowRow(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                skills.forEach { skill ->
                    Surface(
                        shape = RoundedCornerShape(20.dp),
                        color = CardBg,
                        border = BorderStroke(1.dp, Accent.copy(alpha = 0.35f))
                    ) {
                        Text(skill, modifier = Modifier.padding(horizontal = 14.dp, vertical = 8.dp), fontSize = 14.sp)
                    }
                }
            }
        }

        item { SectionTitle("Projects") }
        items(projects.size) { i ->
            val p = projects[i]
            Card(
                colors = CardDefaults.cardColors(containerColor = CardBg),
                shape = RoundedCornerShape(12.dp),
                border = BorderStroke(1.dp, Accent.copy(alpha = 0.2f)),
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(Modifier.padding(20.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    Text(p.title, fontSize = 20.sp, fontWeight = FontWeight.SemiBold)
                    Text(p.description, color = Muted, lineHeight = 22.sp)
                    Text(p.tags.joinToString("   "), color = Accent, fontSize = 13.sp)
                    if (p.link.isNotEmpty()) {
                        TextButton(onClick = { open(p.link) }) { Text("Open project", color = Accent) }
                    }
                }
            }
        }

        item { SectionTitle("Contact") }
        item {
            Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                Text("Open to data analyst and AI/ML roles. Send me a message.", color = Muted)
                Row {
                    TextButton(onClick = { open("mailto:$EMAIL") }) { Text("Email", color = Accent) }
                    TextButton(onClick = { open(GITHUB) }) { Text("GitHub", color = Accent) }
                    TextButton(onClick = { open(LINKEDIN) }) { Text("LinkedIn", color = Accent) }
                }
                Spacer(Modifier.height(24.dp))
            }
        }
    }
}

@Composable
private fun SectionTitle(title: String) {
    Column {
        Text(title, fontSize = 26.sp, fontWeight = FontWeight.Bold)
        Spacer(Modifier.height(6.dp))
        Box(Modifier.width(44.dp).height(3.dp).background(Accent))
    }
}
