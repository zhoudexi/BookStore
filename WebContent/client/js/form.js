window.onload = function () {
    //给表单绑定onsubmit事件
    document.getElementById("form").onsubmit = function () {
        return checkEmail()&&checkUsername()&&checkPassword()&&
        checkRePassword()&&checkPhonemunber();
    }

    //给用户名和密码框、Email、姓名、手机号分别绑定离焦事件
    document.getElementById("Email").onblur = checkEmail;
    document.getElementById("Username").onblur = checkUsername;
    document.getElementById("Password").onblur=checkPassword;
    document.getElementById("RePassword").onblur=checkRePassword;
    document.getElementById("Phonemunber").onblur=checkPhonemunber;
}

//校验联系电话
function checkPhonemunber(){
    //1.获取电话的值
    var phonemunber=document.getElementById("Phonemunber").value;
    //2.定义正则表达式
    var reg_phone=/^([0-9_]{5,11}$)/;
     //3.判断值是否符合正则表达式的规则
    var flag=reg_phone.test(phonemunber);
     //4.提示信息
     var s_phonemunber=document.getElementById("s_phonemunber");
    if(!flag){
        s_phonemunber.innerHTML = "联系电话格式有误";
    }else{
        s_phonemunber.innerHTML = "";
    }
    return flag;
}



//校验确认密码
function checkRePassword(){
    //1.获取密码的值
    var password=document.getElementById("Password").value;
    var Repassword=document.getElementById("RePassword").value;
   
     //2.提示信息
     var s_repassword = document.getElementById("s_repassword");

    if(Repassword!=password){
        s_repassword.innerHTML = "两次密码不一致，请重新输入";
    }else{
        s_repassword.innerHTML = "";
    }
    return flag;
}



//校验密码
function checkPassword(){
    //1.获取密码的值
    var password=document.getElementById("Password").value;
    //2.定义正则表达式
    var reg_password=/^([0-9a-zA-Z_]{6,16}$)/
    //3.判断值是否符合正则的规则
    var flag=reg_password.test(password)

     //4.提示信息
     var s_password = document.getElementById("s_password");

    if(!flag){
        s_password.innerHTML = "密码请设置6到16位字符";
    }else{
        s_password.innerHTML = "";
    }
    return flag;
}

//校验Email
function checkEmail(){
    //1.获取Email的值
    var email = document.getElementById("Email").value;
    //2.定义正则表达式
    var reg_email = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
    //3.判断值是否符合正则的规则
    var flag = reg_email.test(email);
    //4.提示信息
    var s_email = document.getElementById("s_email");

    if(!flag){
        s_email.innerHTML = "请输入有效的邮箱地址";
    }else{
        s_email.innerHTML = "";
    }
    return flag;
}

//校验用户名
function checkUsername() {
    //获取用户名的值
    var username = document.getElementById("Username").value;

    //定义正则表达式
    var reg_username = /^([a-zA-Z_][0-9a-zA-Z_]{1,10})/;
    //判断值是否符合正则表达式的规则
    var flag = reg_username.test(username);

    //提示信息
    var s_username = document.getElementById("s_username");

    if(!flag){
        s_username.innerHTML = "字母数字下划线1到10位，不能是数字开头";
    }else{
        s_username.innerHTML = "";
    }
    return flag;
}