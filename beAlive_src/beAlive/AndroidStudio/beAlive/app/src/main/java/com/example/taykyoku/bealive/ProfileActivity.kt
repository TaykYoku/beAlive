package com.example.taykyoku.bealive

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v4.view.ViewPager
import android.transition.Scene
import kotlinx.android.synthetic.main.activity_main.*

class ProfileActivity : AppCompatActivity() {

    var scene1: Scene? = null
    private lateinit var viewPager: ViewPager

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_profile)

        scene1 = Scene.getSceneForLayout(rootContainer, R.layout.activity_profile_scene_intro, this)

        scene1?.enter()

        viewPager = findViewById(R.id.introSlider)

    }
}
