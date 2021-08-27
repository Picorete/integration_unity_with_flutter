using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class createAndDestroy : MonoBehaviour
{   
    public string message;
    
    private void OnMouseDown() {
        UnityMessageManager.Instance.SendMessageToFlutter( message );
    }
}
