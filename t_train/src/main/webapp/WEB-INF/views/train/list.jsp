<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Train Timetable</title>
</head>
<body>
<div><img src="/upload/banner/train.jpg" style="width: 100%;" >
</div>
<script type="text/javascript">
var xhr = new XMLHttpRequest();
var url = 'http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo'; /*URL*/
var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'Jxwqcdkk560ifanyQyzs7RdyYjABCow9oOnsYt%2FaIgqOOdfpS615bY%2B4AvnnC5l7qtPQERSgw30wZtL6%2FP%2Fm%2BA%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('xml'); /**/
queryParams += '&' + encodeURIComponent('depPlaceId') + '=' + encodeURIComponent('NAT010000'); /**/
queryParams += '&' + encodeURIComponent('arrPlaceId') + '=' + encodeURIComponent('NAT011668'); /**/
queryParams += '&' + encodeURIComponent('depPlandTime') + '=' + encodeURIComponent('20211201'); /**/
queryParams += '&' + encodeURIComponent('trainGradeCode') + '=' + encodeURIComponent('00'); /**/
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
    }
};

xhr.send('');
</script>
</body>
</html>