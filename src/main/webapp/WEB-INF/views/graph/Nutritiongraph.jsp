<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주간영양정보</title>
</head>
<%@ include file="../header.jsp"%>
<style>
.grid line {
    stroke: lightgrey;
    stroke-opacity: 0.7;
}
.lineChart {
    fill: none;
    stroke: steelblue;
    stroke-width: 1.5px;
}
.lineChart:hover {
    stroke: black;
    stroke-width: 3px;
}
.toolTip {
    position: absolute;
    border: 1px solid;
    border-radius: 4px 4px 4px 4px;
    background: rgba(0, 0, 0, 0.8);
    color : white;
    padding: 5px;
    text-align: center;
    font-size: 12px;
    min-width: 30px;
}
svg{
	width: 80rem;
	height: 50rem;
}
svg>g>text{
x:3;
}
</style>


<body>
<div class="container text-center center">
	<div class="border" style="width: 20rem;">
		<div class="pull-left">
			<img alt="?" src="resources/bootstrap/image/q&a.png" style="width: 3rem; height: 3rem;">
		</div>
		<br/><br/>
		<div style="text-align: left; ">
			2000Kcal 기준<br/>
			한끼 권장 칼로리는<br/>
			아침 : 400Kcal<br/>
			점심, 저녁 : 800Kcal 입니다.
		</div>
	</div>
<svg style="width:700; height:320;" ></svg>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script>
$(document).ready(function(){
	$.ajax({
		url:"graph.do",
		type:"post",
		dataType:"json",
		success:function(data){
			var list = data.list;
			if(list[0].tan == 0){
				alert("주문 정보가 없습니다. 주문 후 이용해주세요.");
				location.href="mainpage.do";
			}else{
			
			var series = ["탄수화물", "단백질","지방","칼로리"];
			 
		    var dataset = [ 
		    	 {'1': list[0].tan, '2':list[1].tan, '3':list[2].tan, '4':list[3].tan, '5':list[4].tan, '6':list[5].tan, '7':list[6].tan}, //i=2
		    	 {'1': list[0].dan, '2':list[1].dan, '3':list[2].dan, '4':list[3].dan, '5':list[4].dan, '6':list[5].dan, '7':list[6].dan},
		    	 {'1': list[0].gi, '2':list[1].gi, '3':list[2].gi, '4':list[3].gi, '5':list[4].gi, '6':list[5].gi, '7':list[6].gi},
		    	 {'1': list[0].kcal, '2':list[1].kcal, '3':list[2].kcal, '4':list[3].kcal, '5':list[4].kcal, '6':list[5].kcal, '7':list[6].kcal}];//i=5
		 
		    var keys = d3.keys(dataset[0]);
		    var data = [];
		 
		    dataset.forEach(function(d, i) {
		    data[i] = keys.map(function(key) { return {x: key, y: d[key]}; })
		    });
		 
		    var margin = {left: 20, top: 10, right: 10, bottom: 20};
		    var svg = d3.select("svg");
		    var width  = parseInt(svg.style("width"), 10) - margin.left - margin.right;
		    var height = parseInt(svg.style("height"), 10)- margin.top  - margin.bottom;
		    var svgG = svg.append("g")
		        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
		    var xScale = d3.scalePoint()//scaleBand() scaleOrdinal
		        .domain(keys)
		        .rangeRound([0, width]);
		    var yScale = d3.scaleLinear()
		        .domain([0, d3.max(dataset, function(d) { return d3.max(keys, function(key) { return d[key];});})])
		        .nice()
		        .range([height, 0]);
		    var colors = d3.scaleOrdinal(d3.schemeCategory10);
		 
		    svgG.append("g")
		        .attr("class", "grid")
		        .attr("transform", "translate(0," + height + ")")
		        .call(d3.axisBottom(xScale)
		            .tickSize(-height)
		        );
		 
		    svgG.append("g")
		        .attr("class", "grid")
		        .call(d3.axisLeft(yScale)
		            .ticks(5)
		            .tickSize(-width)
		           );
		 
		    var line = d3.line()
		        //.curve(d3.curveBasis)
		        .x(function(d) { return xScale(d.x); })
		        .y(function(d) { return yScale(d.y); });
		    var lineG = svgG.append("g")
		        .selectAll("g")
		        .data(data)
		           .enter().append("g");
		 
		    lineG.append("path")
		        .attr("class", "lineChart")
		        .style("stroke", function(d, i) { return colors( series[i]); })
		        .attr("d", function(d, i) {return line(d); });
		 
		    lineG.selectAll("dot")
		        .data(function(d) {return d })
		        .enter().append("circle")
		            .attr("r", 3)
		            .attr("cx", function(d) { return xScale(d.x) })
		            .attr("cy", function(d) { return yScale(d.y);})
		            .on("mouseover", function() { tooltip.style("display", null); })
		            .on("mouseout",  function() { tooltip.style("display", "none"); })
		            .on("mousemove", function(d) {
		                tooltip.style("left", (d3.event.pageX+10)+"px");
		                tooltip.style("top",  (d3.event.pageY-10)+"px");
		                tooltip.html("month. " + d.x + "<br/>" + "data value : " + d.y);
		            });

		    var tooltip = d3.select("body")
		        .append("div")
		        .attr("class", "toolTip")
		        .style("display", "none");
		 
		    var legend = svgG.append("g")
		        .attr("text-anchor", "end")
		        .selectAll("g")
		        .data(series)
		        .enter().append("g")
		        .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });
		 
		    legend.append("rect")
		          .attr("x", width - 20)
		          .attr("width", 19)
		          .attr("height", 19)
		          .attr("fill", colors);
		 
		      legend.append("text")
		          .attr("x", width - 30)
		          .attr("y", 9.5)
		          .attr("dy", "0.32em")
		          .text(function(d) { return d; });
			}
		},error:function(){
			alert("통신실패");
		}
	});
});

</script>
	<h1 style="text-align: left; margin-top: 5rem; ">칼로리 계산기</h1>
	<div class="container" style="margin-bottom: 5rem; margin-top: 5rem;">
	
		<div class="col-md-6" style="text-align: left;">
			<input type="radio" id = "man" name="sex" value="man" checked>&nbsp;&nbsp;남자&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" id = "woman" name="sex" value="woman" >&nbsp;&nbsp;여자
			<br/>
			<input type="text" placeholder="키를 입력해주세요" name="tall" id = "input_tall">
			<span>&nbsp;&nbsp;&nbsp;&nbsp;활동량 : </span>
			<select name="활동량" id = "select_action">
		  		<option value="40">많음</option>
		  		<option value="35" selected="selected">보통</option>
		 		 <option value="30" >적음</option>
			</select>
			<br/><br/>
			<input type="button" value="칼로리 확인하기" class="btn btn-outline-light pull-right" style="margin-right: 13rem;" onclick = "checkkal()">
		</div>
	
		<div class="col-md-6" style="text-align: left;">
			<h3>하루 권장 칼로리 : <span id = "onedaykal"></span> </h3>
			<span>{표준체중[키 - 100] * 0.9} * {활동[많음(40) 보통(35) 적음(30)]}</span>
			<br/><br/>
			<h3>한끼 권장 칼로리 : <span id = "onekal"></span></h3>
			<span>하루권장 칼로리 / 3</span>
		</div>
	</div>
</div>

<script>
	function checkkal(){
		var sex = $("input[name=sex]:checked").val();
		
		var action = document.getElementById('select_action').value;
		
		var tall = document.getElementById('input_tall').value;
		
		var kal;
		var onekal;
		
		if(sex == 'man'){
			kal = ((tall - 100) * 0.9) * action;
			onekal = kal / 3;
			$("#onedaykal").text(kal);
			$("#onekal").text(onekal);
		} else if (sex == 'woman'){
			kal = ((tall - 100) * 0.9) * action;
			onekal = kal / 3;
			$("#onedaykal").text(kal);
			$("#onekal").text(onekal);
		}
	}
</script>
<%@ include file="../footer.jsp"%>
</body>
</html>