package com.example.taykyoku.bealive

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.transition.Scene
import android.transition.TransitionManager
import android.view.View
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    var scene1: Scene? = null
    var scene2: Scene? = null
    var scene3: Scene? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        scene1 = Scene.getSceneForLayout(rootContainer, R.layout.activity_main_scene_load, this)
        scene2 = Scene.getSceneForLayout(rootContainer, R.layout.activity_main_scene_login, this)
        scene3 = Scene.getSceneForLayout(rootContainer, R.layout.activity_main_scene_reg, this)

        scene1?.enter()

    }

    fun onClickBar(v: View) {
        TransitionManager.go(scene2)
    }

    fun onClickReg(v: View) {
        TransitionManager.go(scene3)
    }

    fun onClickLogin(v: View) {
        val profIntent = Intent(this, ProfileActivity::class.java)
        startActivity(profIntent)
    }

}
