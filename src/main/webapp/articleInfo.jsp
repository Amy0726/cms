<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>${article.title}</title>
    <meta http-equiv="keywords" content="">
    <meta http-equiv="description" content="">
    <style>
        .content{width: 725px;}
        .title{margin-top: 50px}
        .img-div{height: 555px;width: 725px;}
        img{height: 100%;width: 100%;border-radius:10px}
        .time{color: #999;height:50px;padding-top: 30px;}
        .post-wrapper{margin-left: 100px;width: 1062px;}
        h1{font-family: PingFang SC,Lantinghei SC,Helvetica Neue,Helvetica,Arial,Microsoft YaHei,\\5FAE\8F6F\96C5\9ED1,STHeitiSC-Light,simsun,\\5B8B\4F53,WenQuanYi Zen Hei,WenQuanYi Micro Hei,"sans-serif";  color: #3d464d;  font-size: 26px;  font-weight: 600;  margin-bottom: 28px;  text-align: left;  line-height: 36px;}
        a{text-decoration: none}
        .edit{  display: block;  width: 8rem;  height: 2rem;  line-height: 2rem;  border-radius: 4px;  border: 1px solid #366df0;  text-align: center;  margin-top: 2.5rem;  color: #366df0;  font-size: .8rem;  cursor: pointer;}
    </style>
</head>
<body>
<div class="post-wrapper">
    <div class="title"> <h1>${article.title}</h1></div>
    <div class="time"><fmt:formatDate pattern="yyyy-MM-dd" value="${article.inputtime}" /></div>
    <div class="img-div"><img src="${context}/img/${article.img}"/></div>
    <div class="content">${article.content}</div>
    <a target="_blank" href="${context}/editArticle?id=${article.id}" class="edit">编辑文章</a>
    </div>
</body>
</html>
