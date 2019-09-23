using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Registration : MonoBehaviour
{
    public InputField newUsernameInput;
    public InputField newPasswordInput;
    public InputField konfirmasiPasswordInput;
    public InputField namaInput;
    public InputField emailInput;
    public Dropdown peranDropdown;

    public Button daftarButton;

    public void CallRegister()
    {
        StartCoroutine(Register());
    }

    IEnumerator Register()
    {
        WWWForm form = new WWWForm();
        form.AddField("username", newUsernameInput.text);
        form.AddField("password", newPasswordInput.text);
        form.AddField("konfirmasiPassword", konfirmasiPasswordInput.text);
        form.AddField("nama", namaInput.text);
        form.AddField("email", emailInput.text);
        form.AddField("peran", peranDropdown.value);
        WWW www = new WWW("http://localhost/sqlconnect/register.php", form);
        yield return www;
        if (www.text == "0")
        {
            Debug.Log("User berhasil dibuat.");
            UnityEngine.SceneManagement.SceneManager.LoadScene(0);
        }
        else
        {
            Debug.Log("User gagal dibuat. Error #" + www.text);
        }
    }

    public void VerifyInput()
    {
        daftarButton.interactable = (newUsernameInput.text.Length >= 8 
            && newPasswordInput.text.Length >= 8 
            && newPasswordInput.text == konfirmasiPasswordInput.text
            && peranDropdown.value < 3
            && namaInput.text.Length >0
            && emailInput.text.Length >= 8
            );
    }

}
