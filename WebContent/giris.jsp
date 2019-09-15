<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="eticaret.dao.KategoriDao"
        import="eticaret.model.Kategori" 
        import="java.util.List"%>
<%
 List<Kategori> katiyaz = new KategoriDao().Kategoriler();
 request.setAttribute("kategori", katiyaz);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <title>Akset.com giriş</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="girisekrani.css" type="text/css" rel="stylesheet"/>
	<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
	<div id="mySidenav" class="sidenav">
        <c:forEach var="kategori" items="${kategori}">
             <a href="http://localhost:8080/akset/kat${kategori.kategoriId}.jsp"  id="kat${kategori.kategoriId }">${kategori.kategoriAd}</a>
        </c:forEach>
    </div>

<div style="margin-left:120px;">
	<div class="container">
	   <div class="row">
	    <div class="col-md-5">
		  <div class="login">
			<h2  align="center">Giriş Yapınız...</h2>
			  <c:if test="${uye == null}">
                 <form class="giristab" action="Uyegiris" method="post">
              </c:if>
			      <form  method="post" >
					<p><input name="id" type="text" placeholder="kullanıcı numaranız..." required="" value="<c:out value='${uye.uyeId}' />"/></p>	
					<p><input name="sifre" type="password" placeholder="Parolanız..." required="" value="<c:out value='${uye.uyeSifre}' />"></p>	
					<p class="submit"><input type="submit" value="Giriş Yap"></p>
					   
					   <c:if test="${uyeyok == true}" >
					       <script>
					            alert("üye numaranız veya şifreniz yanlış ");
					            uyeyok=false;
					       </script>
				       </c:if>
			     </form>
			   </form>
			<p align="center">Üye değilseniz hemen üye olun </p>
		   </div>
		  </div>
		  <div class="col-md-5">
		       <h2  align="center">Kaydolunuz...</h2>
		      <c:if test="${uye == null}">
                 <form action="Uyekaydol" method="post">
              </c:if>
             <table border="1" cellpadding="5" class="giristab">
                <c:if test="${uye != null}">
                    <input type="hidden" name="id" value="<c:out value='${uye.uyeId}' />" />
                </c:if>           
             <tr>
                <th>uye numaranız :</th>
                <td>
                    <input type="text" name="id" size="45"
                            value="<c:out value='${uye.uyeId}' />"
                        />
                </td>
            </tr>
            <tr>
                <th>adınız: </th>
                <td>
                    <input type="text" name="ad" size="45"
                            value="<c:out value='${uye.uyeAd}' />"
                    />
                </td>
            </tr>
            <tr>
             <th>soyadınız :</th>
                <td>
                    <input type="text" name="soyad" size="45"
                            value="<c:out value='${uye.uyeSoyad}' />"
                        />
                </td>
            </tr>
            <tr>
             <th>teliniz :</th>
                <td>
                    <input type="text" name="tel" size="45"
                            value="<c:out value='${uye.uyeTel}' />"
                        />
                </td>
              </tr>
              <tr>
             <th>adresiniz :</th>
                <td>
                    <input type="text" name="adres" size="45"
                            value="<c:out value='${uye.uyeAdres}' />"
                        />
                </td>
              </tr>
              <tr>
             <th>mailiniz :</th>
                <td>
                    <input type="text" name="eposta" size="45"
                            value="<c:out value='${uye.uyeEposta}' />"
                        />
                </td>
              </tr>
              <tr>
             <th>sifreniz :</th>
                <td>
                    <input type="password" name="sifre" size="45"
                            value="<c:out value='${uye.uyeSifre}' />"
                        />
                </td>
              </tr>
              <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="kaydet" />
                </td>
            </tr>
        </table>
            <c:if test="${kayitli == true}" >
				   <script>
					            alert("üye numarası kayıtlı,başka numara ile deneyiniz ");
					            kayitli=false;
				  </script>
		    </c:if>
        </form>
           
        
		  </div>
		</div>
	</div>
</div>	
</body>
</html>