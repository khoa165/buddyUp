const initTooltip = () => {
  $(document).ready(function(){
    // $('[data-toggle="tooltip"]').tooltip({placement: 'bottom',trigger: 'manual'}).tooltip('show');
    // $('.custom-bu-tooltip').tooltip({placement: 'top',trigger: 'manual'}).tooltip('show');
    $('.custom-bu-tooltip').tooltip({placement: 'top',trigger: 'manual'}).tooltip('show');
  });
};

export { initTooltip };
