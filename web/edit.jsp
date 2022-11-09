<%-- 
    Document   : edit
    Created on : Mar 13, 2022, 5:07:55 PM
    Author     : citih
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

            * {
                padding: 0;
                margin: 0;
                font-family: 'Poppins', sans-serif
            }

            .container {
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #eee
            }

            .card {
                width: 350px;
                height: 570px;
                background-color: #fff;
                box-shadow: 0px 15px 30px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden
            }

            .card .info {
                padding: 15px;
                display: flex;
                justify-content: space-between;
                border-bottom: 1px solid #e1dede;
                background-color: #e5e5e5
            }

            .card .info button {
                height: 30px;
                width: 80px;
                border: none;
                color: #fff;
                border-radius: 4px;
                background-color: #000;
                cursor: pointer;
                text-transform: uppercase
            }

            .card .forms {
                padding: 15px
            }

            .card .inputs {
                display: flex;
                flex-direction: column;
                margin-bottom: 10px
            }

            .card .inputs span {
                font-size: 12px
            }

            .card .inputs input {
                height: 40px;
                padding: 0px 10px;
                font-size: 17px;
                box-shadow: none;
                outline: none
            }

            .card .inputs input[type="text"][readonly] {
                border: 2px solid rgba(0, 0, 0, 0)
            }

        </style>
        <script>
            var savebutton = document.getElementById('savebutton');
            var readonly = true;
            var inputs = document.querySelectorAll('input[type="text"]');
            savebutton.addEventListener('click', function () {

                for (var i = 0; i < inputs.length; i++) {
                    inputs[i].toggleAttribute('readonly');
                }
                ;
                if (savebutton.innerHTML == "edit") {
                    savebutton.innerHTML = "save";
                } else {
                    savebutton.innerHTML = "edit";
                }
            });
        </script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <form action="edit">
                <div class="info"> <span>Edit form</span> <button id="savebutton">edit</button> </div>
                
                <div class="forms">
                    <div class="inputs"> <span>ID</span> <input name="id" type="text" readonly value="${detail.product_id}"> </div>
                    <div class="inputs"> <span>Name</span> <input name="name" type="text"  value="${detail.product_name}"> </div>
                    <div class="inputs"> <span>Price</span> <input name="price" type="text"  value="${detail.price}"> </div>
                    <div class="inputs"> <span>Quantity</span> <input name="quantity" type="text"  value="${detail.quantity}"> </div>
                    <div class="inputs"> <span>IMG</span> <input name="Image" type="text"  value="${detail.img}"> </div>
                    <div class="inputs"> <span>Describe</span> <input name="describe" type="text"  value="${detail.describe}"> </div>
                     <div class="inputs"> <span>category_id</span> <input name="category" type="text"  value="${detail.category_id}"> </div>
                     
                                                                                        
                </div>
                     </form>
            </div>
        </div>
    </body>
</html>
