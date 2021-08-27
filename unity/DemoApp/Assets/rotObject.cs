using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class rotObject : MonoBehaviour
{

    public float xspeed = 0.0f;
    public float yspeed = 20.0f;
    public float zspeed = 0.0f;

    void Update()
    {
        this.transform.Rotate(
            xspeed * Time.deltaTime,
            yspeed * Time.deltaTime,
            zspeed * Time.deltaTime
       );
    }

}
