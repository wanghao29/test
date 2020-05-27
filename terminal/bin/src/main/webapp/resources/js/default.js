$(function() {
    var path = window.location.pathname;
    if(path.indexOf('terminalSales') != -1){
        $('.active').removeClass().addClass('drop');
        $('#terminalSales').addClass('active');
    }
    else if(path.indexOf('businessIncome') != -1){
        $('.active').removeClass().addClass('drop');
        $('#businessIncome').addClass('active');
    }
    else if(path.indexOf('socialChannelExpand') != -1){
        $('.active').removeClass().addClass('drop');

        $('#businessIncome').addClass('active');
    }
    else if(path.indexOf('corporationCollaboration') != -1){
        $('.active').removeClass().addClass('drop');
        $('#businessIncome').addClass('active');
    }
    else if(path.indexOf('corporationCollaboration') != -1){
        $('.active').removeClass().addClass('drop');
        $('#businessIncome').addClass('active');
    }
    else if(path.indexOf('assetsTurnoverRate') != -1){
        $('.active').removeClass().addClass('drop');
        $('#businessIncome').addClass('active');
    }
    else if(path.indexOf('averageProfit') != -1){
        $('.active').removeClass().addClass('drop');
        $('#assetsTurnoverRate').addClass('active');
    }
    else if(path.indexOf('newRetailOperation') != -1){
        $('.active').removeClass().addClass('drop');
        $('#assetsTurnoverRate').addClass('active');
    }
    else if(path.indexOf('totalProfit') != -1){
        $('.active').removeClass().addClass('drop');
        $('#totalProfit').addClass('active');
    }
    else if(path.indexOf('reduceItem') != -1){
        $('.active').removeClass().addClass('drop');
        $('#pointOption').addClass('active');
    }
/*    $("").find('.a').bind('click', function () {
    	alert("ssdsd");
    
    });*/
    
    
    
});
