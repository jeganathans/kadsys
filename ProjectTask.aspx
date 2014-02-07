<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectTask.aspx.cs" Inherits="KedSys35.ProjectTask" Title="Kadence | Project Tasks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script> 
    <script type="text/javascript" src="assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
    <script type="text/javascript" src="assets/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript" ></script>
    <script src="assets/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript" ></script>
    <script type="text/javascript" src="assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>
        
    <script src="assets/scripts/proposal-wizard.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css" />
    <link href="assets/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="projactall" class="form" runat="server">
        <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE Status & BREADCRUMB-->
            <h3 class="page-Status">
                Project Task
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="ProjectDashboard.aspx">Home</a> <i class="icon-angle-right">
                </i></li>
                <li><a href="ProjectAll.aspx">Projects</a><i class="icon-angle-right">
                </i></li>
                <li><a id="brdProjectID" href="Projects.aspx" runat="server"></a></li>
            </ul>
            <!-- END PAGE Status & BREADCRUMB-->
        </div>
        <asp:HiddenField ID="hidUID" runat="server" />
        <asp:HiddenField ID="hidtoaster" runat="server" />
        <asp:HiddenField ID="hidTotalHours" runat="server" />
    </div>
    
    <div id="portlet-control-main" class="portlet box green">
        <div class="portlet-title">
            <div class="caption">
                Project Tasks</div>
            <div class="pull-right">
            </div>
        </div>
        
        <div id="portlet-detail" class="portlet-body">
            <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server">
            </asp:ScriptManager>
            <div class="upheight">
            <asp:UpdatePanel ID="panelemppanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
                <ContentTemplate >
                    <div class="nomargintop">
                        <div class="listleftside">
                            <asp:DropDownList ID="ddEmpDept" CssClass="form-control" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="DDEmpDept_Changed">
                            </asp:DropDownList>
                            <asp:ListView ID="lvEmployee" runat="server">
                                <LayoutTemplate>
                                    <ul class="clearfix nopadingleft">
                                        <input id="empfilt" class="form-control csearchbg" />
                                        <div class="clearfix zemplist">
                                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                        </div>
                                    </ul>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <li class="btn btn-xs default margin1 textleft curpointer" style="width: 200px" data-emp="yes"
                                        data-employeeid="<%#Eval("EmployeeID")%>">
                                        <%#Eval("EmpName")%>
                                    </li>
                                    <div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <div class="marginleft250 nopadingtop">
                            <asp:ListView ID="lvTasks" runat="server">
                                <LayoutTemplate>
                                    <ul class="sub-menu nopadingleft">
                                        <div class="form-group">
                                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                        </div>
                                    </ul>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <li class="btn btn-xs default margin1 textleft curpointer" style="width: 140x" data-task="yes">
                                        <%#Eval("TaskName")%>
                                    </li>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
                                <ContentTemplate>
                                    <asp:GridView runat="server" ID="grdTasks" AutoGenerateColumns="false" OnRowDataBound="grdTasks_OnRowDataBound"
                                        class="proptable table-bordered">
                                        <Columns>
                                            <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                                <ItemTemplate>
                                                    <asp:Label ID="UID" runat="server" Text='<%#Eval("UID")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="EmployeeID" CssClass="boxlefttrans" runat="server" Text='<%#Eval("EmployeeID")%>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblEmployee" runat="server" Text="Employee"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="EmpName" CssClass="boxlefttrans" runat="server" Width="175px" Style="max-width: 210px"
                                                        Text='<%#Eval("EmpName")%>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblTaskName" runat="server" Text="Task Name"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TaskName" CssClass="boxlefttrans" runat="server" Width="175px" Style="max-width: 210px"
                                                        Text='<%#Eval("TaskName")%>'></asp:TextBox>
                                                        <i></i>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblStart" runat="server" Text="Start Date"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <input name="StartDateH" style="max-width: 100px" class="boxlefttrans date-picker-start"
                                                        size="16" type="text" value='<%#Eval("StartDate")%>' />
                                                    <asp:TextBox ID="StartDate" Style="max-width: 100px" CssClass="hidden" runat="server"
                                                        Text='<%#Eval("StartDate")%>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblEnd" CssClass="boxleft" runat="server" Text="End Date"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <input name="EndDateH" style="max-width: 100px" class="boxlefttrans date-picker-end"
                                                        size="16" type="text" value='<%#Eval("EndDate")%>' />
                                                    <asp:TextBox ID="EndDate" Style="max-width: 100px" CssClass="hidden" runat="server"
                                                        Text='<%#Eval("EndDate")%>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblHours" CssClass="text-center" Style="max-width: 75px" runat="server"
                                                        Text="Hours per Day"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="Hours" Style="max-width: 75px" CssClass="cboxdec text-right" runat="server"
                                                        Text='<%#Eval("Hours")%>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblTaskStatus" CssClass="text-center" Style="max-width: 75px" runat="server"
                                                        Text="Task Status"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="TaskStatus" runat="server" ></asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblStatus" CssClass="text-center" runat="server" Text="Status"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Image ID="imgstatus" runat="server" Visible="false"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btn_deletetask" name="btn_deletetask" type="submit" class="btn purple btn-xs" ToolTip="Delete Task"
                                                        runat="server" Text="<i class='icon-remove'></i>" OnCommand="btn_deletetask">
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="RecordSequence" runat="server" Text='<%#Eval("RecordSequence")%>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:Button ID="btnupdatetask" Style="display: none" runat="server" Text="Button"
                                        OnClick="btnupdatetask_Click" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnupdatetask" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="ddEmpDept" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="grdTasks" EventName="RowDataBound" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddEmpDept" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
            </div>
        </div>
        <div class="form-actions right">
                <asp:Button id="btn_submit" class="btn green button-submit" text="Submit" type="submit" runat="server" onclick="btnfinalsumbit_Click"></asp:Button>
            </div>
    </div>
     
        
        <script>
        
            jQuery(document).ready(function() {
                $('.button-submit').click(function() {
                    var $valid = checkvalid();
                    if(!$valid) {
                        toastr.options = {
                            closeButton: true,
                            timeOut: "6000",
                            positionClass: "toast-bottom-full-width",
                            onclick: null
                        };
                        var $toast = toastr["warning"]("Please correct the errors", "Validation Failed");
                        return false;
                    } 
                });
            });
        
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(function() {
                LoadTaskScript();
            });
            
            function checkvalid() {
                var resValid;
                resValid = false;
                
                var hasvaluesAll = 1;
                
                $('.proptable tr').each(function (i, row) {
                    var inputs = $(row).closest('tr').find('input[data-taskinput]')
                    var emptytask = true;
                    var hasvalues = 1;
                    $.each(inputs, function(index, inputs) {
                        if (inputs.value.trim().length == 0)
                        { 
                            $(inputs).closest('td').find('input').addClass('cerrortask');
                            $(inputs).closest('td').find('input').attr("title", "Required");
                            hasvalues = 0;
                        }
                        else
                        {
                            emptytask = false;
                            $(inputs).closest('td').find('input').removeClass('cerrortask');
                            
                            if (inputs.name.indexOf("Hours") > 0 )
                            {
                                var ivalue = Number(inputs.value.replace(/[^0-9\.]+/g,""));
                                var tothours = Number($("[name$=hidTotalHours]")[0].value.replace(/[^0-9\.]+/g,""));
                                if (ivalue > tothours)
                                {
                                    $(inputs).closest('td').find('input').addClass('cerrortask');
                                    $(inputs).closest('td').find('input').attr("title", "Should be less than or equal to " + tothours + " Hours");
                                    hasvalues = 0;
                                }
                            }
                            
                            
                        }
                        
                    });
                    if (emptytask == true)
                    {
                        $(row).closest('tr').find('input').removeClass('cerrortask');
                        hasvalues = 1;
                    }
                    if (hasvalues == 0)
                        hasvaluesAll = 0;
                });
                
                if (hasvaluesAll == 1)
                    resValid = true;
                else
                    resValid = false;
                
                return resValid;
                
            }
            
            function setactiheight() {
                if ($('.marginleft250').height() < $('.listleftside').height())
                    $('.upheight').height($('.listleftside').height());
                else
                    $('.upheight').height($('.marginleft250').height());
            }
        
            function LoadTaskScript() {
            
                $("[name$=Hours]").inputmask("decimal",{digits: 2, validator: "[0-8]",
                    placeholder:" ", clearMaskOnLostFocus: true 
                });
                
                $('#empfilt').keyup(function(){
                   var valThis = $(this).val().toLowerCase();
                    $('.zemplist>li').each(function(){
                     var text = $(this).text().toLowerCase();
                        if ((text.indexOf(valThis) > 0) || valThis=="")
                            $(this).show();
                        else
                            $(this).hide();         
                   });
                   setactiheight();
                });
                
               
                
                setactiheight();
                
                
                
                jQuery('input[data-newtask]').attr('readonly','readonly');
                jQuery('input[data-newemp]').attr('readonly','readonly');
                
                $('[data-taskinput]').change(function() {
                    /*if (this.value.length == 0)
                    {
                        if ($(this).closest('tr').find("[name$=RecordSequence]").val() != "-1");
                        this.focus();
                        alert("Value could not be empty");
                    }
                    else*/
                    
                    if (this.name.indexOf("Hours") > 0 )
                    {
                        var ivalue = Number(this.value.replace(/[^0-9\.]+/g,""));
                        var tothours = Number($("[name$=hidTotalHours]")[0].value.replace(/[^0-9\.]+/g,""));
                        if (ivalue > tothours)
                        {
                            $(this).closest('td').find('input').addClass('cerrortask');
                            $(this).closest('td').find('input').attr("title", "Should be less than or equal to " + tothours + " Hours");
                            return;
                        }
                        else
                            $(this).closest('td').find('input').removeClass('cerrortask');
                    }
                    
                        checkupdate(this);
                });
                
                $('.date-picker-start, .date-picker-end').change(function() {
                    if ($(this).val().trim().length == 0)
                    {
                        var objValue = $(this).closest('td').find('[data-taskinput]')[0];
                        objValue.value = "";
                    }
                });
                
                if (jQuery().datepicker) {
                    $(".date-picker-start")
                    .datepicker({
                        dateFormat: "mm/dd/yyyy",
                        rtl: App.isRTL(),
                        autoclose: true,
                        forceParse: true
                    })
                    .on('changeDate', function(ev, inst){
                        var newDate = $(this).datepicker("getDate");
                        if (!Date.parse(newDate))
                            return;
                        var newText = $(this)[0].value;
                        var objStart = $(this).closest('td').find('[data-taskinput]')[0];
                        var objStartDate = new Date(objStart.value);
                        var objEndH = $(this).closest('td').next('td').find('.date-picker-end')[0];
                        var objEnd = $(this).closest('td').next('td').find('[data-taskinput]')[0];
                        var objEndDate = new Date(objEnd.value);
                        if (objStartDate == newDate)
                            return;
                        else
                        {
                            objStart.value = newText;
                            $(objEndH).datepicker('setStartDate', newText);

                            if (!Date.parse(objEndDate))
                            {
                                $(this).datepicker('hide');
                                $(objEndH).datepicker('show');
                            }
                            else if (objEndDate < newDate)
                            {
                                objEndH.value="";
                                objEnd.value="";
                                $(this).datepicker('hide');
                                $(objEndH).datepicker('show');
                            }
                            else if (objEndDate >= newDate) 
                                checkupdate(objStart);
                            
                            
                        }
                    });
                    
                    
                    $(".date-picker-end").datepicker({
                        dateFormat: "mm/dd/yyyy",
                        rtl: App.isRTL(),
                        autoclose: true,
                        forceParse: true
                    })
                    .on('changeDate', function(ev, inst){
                        var newDate = $(this).datepicker("getDate");
                        if (!Date.parse(newDate))
                            return;
                        var newText = $(this)[0].value;
                        var objEnd = $(this).closest('td').find('[data-taskinput]')[0];
                        var objEndDate = new Date(objEnd.value);
                        var objStartH = $(this).closest('td').prev('td').find('.date-picker-start')[0];
                        var objStart = $(this).closest('td').prev('td').find('[data-taskinput]')[0];
                        var objStartDate = new Date(objStart.value);
                        if (objEndDate == newDate)
                            return;
                        else
                        {
                            objEnd.value = newText;
                            if (!Date.parse(objStartDate))
                            {
                                $(this).datepicker('hide');
                                $(objStartH).datepicker('show');
                            }
                            else if (objStartDate > newDate)
                            {
                                objStartH.value="";
                                objStart.value="";
                                $(this).datepicker('hide');
                                $(objStartH).datepicker('show');
                            }
                            else if (objStartDate <= newDate) 
                                checkupdate(objEnd);
                        }
                    });
                    
                    
                    var dataendp = $(".date-picker-end");
                    $.each(dataendp, function(index, dataendp) {
                        var objStartH = $(dataendp).closest('td').prev('td').find('.date-picker-start')[0];
                        if(objStartH.value)
                            $(dataendp).datepicker('setStartDate', objStartH.value);
                        else
                            $(dataendp).datepicker('setStartDate', null);
                        
                    });
                }
                

                function checkupdate(objchanged)
                {
                    /*alert("change");
                    return;*/
                    if ($('.cerrortask').length > 0)
                        return;
                    
                    var inputs = $(objchanged).closest('tr').find('input[data-taskinput]')
                    var hasvalues = 1;
                    $.each(inputs, function(index, inputs) {
                        if (inputs.value.trim().length == 0)
                        { 
                            //$(inputs).closest('td').find('input').addClass('cerrortask');
                            hasvalues = 0;
                        }
                        else
                        {
                            $(inputs).closest('td').find('input').removeClass('cerrortask');
                        }
                    });
                    
                    if (hasvalues == 1)
                        document.getElementById('<%= btnupdatetask.ClientID %>').click();
                    
                }
            
                jQuery(document).ready(function() {
                    $('li[data-task]').draggable({ revert: true });
                    $('input[data-newtask]').droppable({
                        accept: 'li[data-task]',
                        drop: function(event, ui) {
                            var targecell = $(event.target); //.find('input');
                            var taskname = event.srcElement.innerText.trim();
                            targecell[0].value = taskname;
                            checkupdate(targecell[0]);
                        },
                        activeClass: "highlighttask",


                    });
                        
                    $('li[data-emp]').draggable({ revert: true });
                    $('input[data-newemp]').droppable({  //.closest('td').droppable({
                        accept: 'li[data-emp]',
                        drop: function(event, ui) {
                            var targecell = $(event.target); //.find('input');
                            var empname = event.srcElement.innerText.trim();
                            var targetidcell = $(targecell).closest('tr').find("[name$=EmployeeID]")
                            var empid = event.srcElement.getAttribute("data-EmployeeID");
                            targecell[0].value = empname;
                            targetidcell[0].value = empid;
                            checkupdate(targecell[0]);
                        },
                        activeClass: "highlighttask",
                    });
                    
                    
                    
                    
                });
            }
            
            jQuery(document).ready(function() {
                   LoadTaskScript(); 
            });

            jQuery(document).ready(function() {
                var data = $("#<%= hidtoaster.ClientID %>").val()
                var arr = data.split('|');
                if (arr.length >= 2) {
                    var typ = arr[0];
                    var msg = arr[1];
                    toastr.options = {
                        closeButton: true,
                        timeOut: "6000",
                        positionClass: "toast-bottom-full-width",
                        onclick: null
                    };
                    var $toast = toastr[typ](msg, "Notification");
                }
            });

            
        </script>
    </form>
</asp:Content>
