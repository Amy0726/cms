<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript"src="ueditor/ueditor.config.js"></script>
<script type="text/javascript"src="ueditor/ueditor.all.js"></script>
<html>
<head>
    <title>保存文章</title>
    <meta http-equiv="keywords" content="">
    <meta http-equiv="description" content="">
    <style type="text/css">
        *{margin: 0px;padding: 0px}
        .all{margin-left:200px}
        .head{height:40px;width:800px;background-color:#99D3F5;font-size:24px;color: white;padding-left: 50px;padding-top: 10px}
        .menu{width: 100px;float: left;border-right:1px solid #cfcfcf;height: 700px}
        .menu a{text-decoration: none}
        ul{list-style-type: none;}
        li{color: #cfcfcf;width: 100px;text-align: center;margin-top:15px}
        li:hover{color:white;width: 100px;background-color: #99D3F5}
        .post-wrapper{width: 700px;float: left;margin-left:40px}
        .title{margin-top: 50px;color: #cfcfcf}
        .text{width:300px;height: 30px}
        .img-div{height:500px;width:725px;margin-top:50px}
         img{height:400px;width:500px}
        .file {position: relative;  display: inline-block;  background: #D0EEFF;  border: 1px solid #99d3f5;border-radius: 4px;  padding: 4px 12px;  overflow: hidden;  color: #1E88C7;  text-decoration: none;  text-indent: 0;  line-height: 20px;  }
        .file input {  position: absolute;  font-size: 100px;  right: 0;  top: 0;  opacity: 0;  }
        .file:hover {  background: #AADFFD;  border-color: #78C3F3;  color: #004974;  text-decoration: none;  }
        .save{display: block;  width: 8rem;  height: 2rem;  line-height: 2rem;  border-radius: 4px;  border: 1px solid #366df0;  text-align: center;  margin-top: 2.5rem;  color: #366df0;  font-size: .8rem;  cursor: pointer;}
    </style>

</head>
<body>
<div class="all">
<div class="head" >
    后台管理系统
</div>
<div class="menu" alert="center">
    <ul>
       <a href="/editArticleList"> <li>编辑文章</li></a>
       <a href="/addArticle"> <li>创建文章</li></a>
    </ul>
</div>
    <form action="saveArticle" method="POST" enctype="multipart/form-data">
    <div class="post-wrapper"><input type="hidden" name="id" value="${article.id}">
    <div class="title">标题：<input type="text" value="${article.title}" class="text" name="title"/></div>
    <div class="img-div">
        <c:if test="${article==null}">
            <a class="file"><input  class="file" type="file" name='img' id="doc1" onchange="javascript:setImagePreview(1)"  title='选择上传的图片' style="width:200px"/>选择上传的图片</a>
            <p id="localImag"><img id="preview1"/></p>
        </c:if>
        <c:if test="${article!=null}">
            <a class="file"><input class="file"   type="file" name='img' id="doc2" onchange="javascript:setImagePreview(2)"  title='选择上传的图片' style="width:200px"/>选择上传的图片</a>
            <p id="localImag"><img src="img/${article.img}" id="preview2" /></p>
        </c:if>
        </div>
    <div class="area"><textarea name="content" id="myEditor" style="height: 500px;width: 700px;">${article.content}</textarea></div>
    <input type="submit" class="save"></input>
    </div>
    </form>
</div>
<script typescripttype="text/javascript">
UEDITOR_CONFIG.UEDITOR_HOME_URL = './ueditor/';
UE.getEditor('myEditor');
function setImagePreview(i)
{
    var docObj=document.getElementById("doc"+i);
    var imgObjPreview=document.getElementById("preview"+i);
    if(docObj.files&&docObj.files[0]){
        imgObjPreview.style.height="400px";
        imgObjPreview.style.width="500px";
        imgObjPreview.src=window.URL.createObjectURL(docObj.files[0]);
    }
    else
    {
        imgObjPreview.src="";
    }
    return true;


}
</script>
</body>
</html>
