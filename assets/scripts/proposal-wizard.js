var PropWizard = function() {


    return {
        //main function to initiate the module
        init: function() {
            if (!jQuery().bootstrapWizard) {
                return;
            }
            
            
            

            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: App.isRTL(),
                    autoclose: true,
                    startDate: "0d"
                });

                $('.date-picker-past').datepicker({
                    rtl: App.isRTL(),
                    autoclose: true,
                    endDate: "0d"
                });
                //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
            }


            function format(state) {
                if (!state.id) return state.text; // optgroup
                return "<img class='flag' src='assets/img/flags/" + state.id.toLowerCase() + ".png'/>&nbsp;&nbsp;" + state.text;
            }

            

            var displayConfirm = function() {
                $('#tab4 .form-control-static', form).each(function() {
                    var input = $('[name="' + $(this).attr("data-display") + '"]', form);
                    if (input.is(":text") || input.is("textarea")) {
                        $(this).html(input.val());
                    } else if (input.is("select")) {
                        $(this).html(input.find('option:selected').text());
                    } else if (input.is(":radio") && input.is(":checked")) {
                        $(this).html(input.attr("data-title"));
                    } else if ($(this).attr("data-display") == 'payment') {
                        var payment = [];
                        $('[name="payment[]"]').each(function() {
                            payment.push($(this).attr('data-title'));
                        });
                        $(this).html(payment.join("<br>"));
                    }
                });
            }

            var handleTitle = function(tab, navigation, index) {
                var total = navigation.find('li').length;
                var current = index + 1;
                // set wizard title
                $('.step-title', $('#form_wizard_1')).text('Step ' + (index + 1) + ' of ' + total);
                // set done steps
                jQuery('li', $('#form_wizard_1')).removeClass("done");
                var li_list = navigation.find('li');
                for (var i = 0; i < index; i++) {
                    jQuery(li_list[i]).addClass("done");
                }

                if (current == 1) {
                    $('#form_wizard_1').find('.button-previous').hide();
                } else {
                    $('#form_wizard_1').find('.button-previous').show();
                }

                if (current >= total) {
                    $('#form_wizard_1').find('.button-next').hide();
                    $('#form_wizard_1').find('.button-save').hide();
                    $('#form_wizard_1').find('.button-submit').show();
                    displayConfirm();
                } else {
                    $('#form_wizard_1').find('.button-next').show();
                    $('#form_wizard_1').find('.button-save').show();
                    $('#form_wizard_1').find('.button-submit').hide();      //hide
                }
                App.scrollTo($('.page-title'));
            }
            
            var form = $('form');
            // default form wizard
            $('#form_wizard_1').bootstrapWizard({
                'nextSelector': '.button-next',
                'previousSelector': '.button-previous',
                onTabClick: function(tab, navigation, index, clickedIndex) {
                    if (form.valid() == false) {
                        return false;
                    }
                    if (checkvalid() == false) {
                        toastr.options = {
                            closeButton: true,
                            timeOut: "6000",
                            positionClass: "toast-bottom-full-width",
                            onclick: null
                        };
                        var $toast = toastr["warning"]("Please correct the errors", "Validation Failed");
                        return false;
                    }
                    handleTitle(tab, navigation, clickedIndex);
                },
                onNext: function(tab, navigation, index) {
                    if (form.valid() == false) {
                        return false;
                    }
                    if (checkvalid() == false) {
                        toastr.options = {
                            closeButton: true,
                            timeOut: "6000",
                            positionClass: "toast-bottom-full-width",
                            onclick: null
                        };
                        var $toast = toastr["warning"]("Please correct the errors", "Validation Failed");
                        return false;
                    }
                    handleTitle(tab, navigation, index);
                },
                onPrevious: function(tab, navigation, index) {
                    if (form.valid() == false) {
                        return false;
                    }
                    if (checkvalid() == false) {
                        toastr.options = {
                            closeButton: true,
                            timeOut: "6000",
                            positionClass: "toast-bottom-full-width",
                            onclick: null
                        };
                        var $toast = toastr["warning"]("Please correct the errors", "Validation Failed");
                        return false;
                    }
                    handleTitle(tab, navigation, index);
                },
                onTabShow: function(tab, navigation, index) {
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    var $percent = (current / total) * 100;
                    $('#form_wizard_1').find('.progress-bar').css({
                        width: $percent + '%'
                    });
                    handleTitle(tab, navigation, index);
                }
            });

            $('#form_wizard_1').find('.button-previous').hide();
            /*$('#form_wizard_1 .button-submit').click(function() {
                alert('Finished! Hope you like it :)');
            }).hide();*/

        }

    };

} ();