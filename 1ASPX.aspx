<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head>
    <title>Validacion de datos</title>
</head>
<body>
    <form id="loginForm" runat="server">
        <div>
            <label for="txtUsuario">Usuario:</label>
            <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
            <br />
            <label for="txtClave">Contraseña:</label>
            <asp:TextBox ID="txtClave" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Iniciar sesión" OnClick="btnLogin" />
        </div>
    </form>

	<%@ Import Namespace="System.Net.Http" %>
    <%@ Import Namespace="System.Text" %>
    <% 
        void btnLogin(object sender, EventArgs e)
        {
            string username = txtUsuario.Text;
            string password = txtClave.Text;

            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password))
            {
                using (HttpClient httpClient = new HttpClient())
                {
                    string apiUrl = "http://dominio.com/api/login";
                    var requestData = new { Username = username, Password = password };
                    string jsonData = Newtonsoft.Json.JsonConvert.SerializeObject(requestData);
                    var content = new StringContent(jsonData, Encoding.UTF8, "application/json");

                    HttpResponseMessage response = httpClient.PostAsync(apiUrl, content).Result;

                    if (response.IsSuccessStatusCode)
                    {
                        //Login exitoso
                    }
                    else
                    {
                        //Login fallido
                    }
                }
            }
        }
    %>
</body>
</html>