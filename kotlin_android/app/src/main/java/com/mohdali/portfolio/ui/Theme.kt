package com.mohdali.portfolio.ui

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color

val Bg = Color(0xFF0A0F0D)
val CardBg = Color(0xFF111A16)
val Accent = Color(0xFF3DDC97)
val Muted = Color(0xFF8FA39A)

private val Colors = darkColorScheme(
    primary = Accent,
    background = Bg,
    surface = CardBg,
    onPrimary = Bg,
    onBackground = Color.White,
    onSurface = Color.White,
)

@Composable
fun PortfolioTheme(content: @Composable () -> Unit) {
    MaterialTheme(colorScheme = Colors, content = content)
}
