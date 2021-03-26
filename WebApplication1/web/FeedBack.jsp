<%-- 
    Document   : FeedBack
    Created on : 20 Mar, 2021, 12:10:41 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
            <form action="FeedBacks" method="post">
                <table>
                    <tr>
                        <td>Enter Name:</td>
                        <td> <input type="text" name="cname">  </td>
                    </tr>
                      <tr>
                        <td>Enter Mail:</td>
                        <td> <input type="text" name="cmail">  </td>
                    </tr>
                      <tr>
                        <td>Enter Message:</td>
                        <td> <textarea name="cmessage"> </textarea>  </td>
                    </tr>
                    <tr> <td> <input type="submit" value="Send" ></td> </tr>
                </table>
            </form>
        
    </body>
</html>
