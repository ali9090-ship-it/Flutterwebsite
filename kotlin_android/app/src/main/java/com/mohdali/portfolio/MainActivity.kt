package com.mohdali.portfolio

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import com.mohdali.portfolio.ui.PortfolioScreen
import com.mohdali.portfolio.ui.PortfolioTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            PortfolioTheme {
                PortfolioScreen()
            }
        }
    }
}
