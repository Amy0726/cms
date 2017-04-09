<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>文章列表</title>
    <meta http-equiv="keywords" content="">
    <meta http-equiv="description" content="">
    <style type="text/css">
        a{color:black;display:inline }
        .inner:hover{background-color:#cfcfcf;background-color:rgba(0,0,0,0.1); }
        h3:hover{color: #0000cc}
        .center_content{width: 1200px;margin-left: 50px;}
        li{list-style-type: none}
        .inner{border-bottom: rgba(75,40,54,0.46) 1px solid;width: 1062px;height: 170px;padding-top: 10px;}
        .img_box{width:260px;height: 150px;float: left;overflow: hidden;}
        img{width: 100%;height: 100%;}
        img:hover{ transform: scale(1.02);zoom:1.05;}
        .intor{width:800px;height: 150px;float: left;position: relative}
        h3{font-size: 24px;position: absolute;left: 50px}
        .time_div{clear: both;position: absolute;bottom: 0px;left: 50px;font-size:12px;color: rgba(111,59,80,0.46)}
        .loading_more{  display: block;  width: 8rem;  height: 2rem;  line-height: 2rem;  border-radius: 4px;  margin: 0 auto;  border: 1px solid #366df0;  text-align: center;  margin-top: 2.5rem;  color: #366df0;  font-size: .8rem;  cursor: pointer;}
    </style>
</head>
<body>
<div >
  <div class="center_content">
    <ul>
      <c:forEach items="${list}" var="article" varStatus="stat">
        <li id="tr${article.id}">
            <a target="_blank" href="/articleInfo?id=${article.id}" >
                <div class="inner">
                    <div class="img_box"><img src="img/${article.img}"/></div>
                    <div class="intor"><h3>${article.title}</h3><div class="time_div"><fmt:formatDate pattern="yyyy-MM-dd" value="${article.inputtime}" /></div></div>
                </div>
            </a>
        </li>
      </c:forEach>
    </ul>
  </div>
  <div class="loading_more" id="loading">
     浏览更多
  </div>
</div>
</body>
</html>
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">

    $(function(){
        $("div[id^=loading]").click(function(){
            var id;
            $("ul").each(function () {
                var last=$(this).children().last();
                 id=$(last).attr("id").substr(2);
            })
            $.ajax({
                async:false,
                type: "POST",
                url: "get",
                data:{"id":id},
                dataType:"json",
                success:function(data){
                    $.each(data, function (i, item) {
                       var i=new Date(parseInt(item.inputtime, 10));
                        var year = i.getFullYear();
                        var month = i.getMonth() + 1;
                        var day = i.getDate();
                        if(month<10) month="0"+month;
                        if(day<10) day="0"+day;
                        $("ul").append("<li id='tr"+item.id+"'><a target='_blank'  href='/articleInfo?id="+item.id+"' ><div class='inner'><div class='img_box'><img src='img/"+item.img+"'/></div> <div class='intor'><h3>"+item.title+"</h3><div class='time_div'>"+ year + "-" + month + "-" + day+"</div></div></div></a></li>");

                    });
                },
            });
            $("div[id^=loading]").text("浏览更多");

        })
    });
</script>
