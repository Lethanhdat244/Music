/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const formHTML = document.getElementById("editProfile");
const btnCheck = document.getElementById("btnCheck");
function editTrigger() {
    let text1 = "<button class='btn-submit' type='submit' title='submit'><i class='uil uil-check'></i></button>";
    text1 += "<nav onclick='cancleEdit()' title='cancle' class='btn-submit' style='padding: 0 5px'><i class='uil uil-times'></i></nav>";
    btnCheck.innerHTML = text1;


}
function cancleEdit() {
    btnCheck.innerHTML = "<nav onclick='editTrigger()' title='edit' class='btn-submit' style='padding: 0 5px'><i class='uil uil-edit'></i></nav>";

}


