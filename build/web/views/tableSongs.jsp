<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    var listL = [];
    <c:forEach items="${listL}" var="l">
    listL.push(${l});
    </c:forEach>
</script>
<div class="table-song">	
    <table class="stable"cellspacing="0" cellpadding="0">
        <c:forEach items="${listS}" var="s" varStatus="check">
            <tr class="row1">
                <td class="play-mini" >
                    <i style="display:block;" class="uil uil-play" onclick="jumpAt(${check.index})"></i>
                </td>
                <td>${s.title}</td>
                <td ><a class="cellArtist" href="#">${s.alb.artist.name}</a></td>
                <td>${s.alb.title}</td>
                <td>${DateUtils.getYear(s.alb.rdate)}</td>
                <td>${s.genre.title}</td>
                <td>
                    <span class="year">${DateUtils.getTime(s.duration)}<span>
                            <span class="fav-btn"  onclick="loveAction(${s.id})">
                                <c:if test="${sessionScope.user_ses!=null}">
                                    <i class="uil uil-heart" id="love${s.id}"></i>
                                </c:if>
                            </span>
                            </td>

                            </tr>

                            <c:if test="${sessionScope.user_ses!=null}">
                                <script>
                                    if (listL.includes(${s.id})) {
                                        // s.id is found in listL
                                        document.getElementById("love${s.id}").style.color = "rgb(255, 22, 69)";
                                        console.log("found");
                                    } else {
                                        // s.id is not found in listL
                                        document.getElementById("love${s.id}").style.color = "white";
                                    }
                                </script>
                            </c:if>
                        </c:forEach>
                        </table>
                        ${anonn}

                        </div>
