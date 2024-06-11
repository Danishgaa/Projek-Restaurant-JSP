<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
 <%@include file="header.jsp" %>
 
    <section class="menu">
    <h1><span class="diff">"</span>Detail<span class="diff">"</span></h1>
    <div>
        <center>
            <img src="https://www.masakapahariini.com/wp-content/uploads/2019/11/resep-mie-bakso.jpg"
                 width="500" height="375" border="10px">
            <br>


            <div class="input-group mb-3">
            </div>
            <!--Action diganti dengan menu-->
            <form action="menu" method="Post">
                <!--Isi Value ganti di masing2 jsp dengan sesuai--> 
                <%
                String id_user = (String) session.getAttribute("id");
                %>
                <input type="hidden" class="form-control"  name="nama_makanan" value="Bakso">
                <input type="hidden" class="form-control"  name="id_user" value="<%=id_user%>">
                <!--Isi Value sesuai Dengan harga-->
                                <input type="hidden" class="form-control"  name="harga" value="20000">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Masukan jumlah</label>
                    <input type="number" class="form-control" aria-label="Dollar amount (with dot and two decimal places)" name="jumlah"required>
                </div>
                <div class="mb-3">
                    <div class="form-group">
                        <label>Jenis Bakso</label>
                        <!--Di ubah Option nya ditambahkan value-->
                        <select name="rasa" class="form-control"required>
                            <option disabled="disabled">-- Rasa --</option>
                            <option value="Original">Bakso Beranak</option>
                            <option value="Madu">Bakso Mercon</option>
                            <option value="Manis">Bakso Biasa</option>
                        </select>
                    </div>
                </div>
        </center>

 <!--Ditambakan kan ini sampai......-->
        <div class="mb-3">
            <center>
                <label for="exampleInputEmail1" class="form-label">alamat</label>
            </center>
            <input type="text" class="form-control" name="alamat"required>
        </div>
        <div class="mb-3">
            <center>
                <label for="exampleInputEmail1" class="form-label">Informasi Tambahan</label>
            </center>
            <input type="text" class="form-control" name="info"required>
        </div>
  <!--sini-->
        <center>
            <button type="submit" class="btn btn-primary">Submit</button>
            </form>



    </div>

</section>
<%@include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
