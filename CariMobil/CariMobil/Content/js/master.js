function showResult(str) {
    $.ajax({
        url: "/Cari/CariSearch",
        data: { "query": str },
        type: "get",
        dataType: 'html',
        // Request'in browser üzerinden cache'lenecek mi 
        cache: false,
        success: function (data, status, jqXHR) {
            var arr = $.parseJSON(data);
            var len = arr.length;
            var tr_str = "";
            tr_str += '<div class="row"><div class="col-sm-12"><div class="col-sm-4"><span class="text-success"> ' + len + ' adet sonuç bulundu<span></div></div></div>'
            
            for (var i = 0; i < len; i++) {
                tr_str += '<div class="card mb-3 item-row"> <div class="row no-gutters"> <div class="col-sm-2"><img src="/Content/images/photos/photo1.jpg" class="card-img" alt="..."></div>                            <div class="col-sm-10">                                <div class="card-body">                                    <h5 class="card-title">                                    <a href="/cari/Detay/35"><b> ' + arr[i].ad + ' </b></a>                                    </h5>                                    <p class="card-text">                                    <b>e-mail : </b> <span>' + arr[i].email + ' </span> &nbsp;                                                <b>Tel : </b> <span>' + arr[i].tel + '</span>&nbsp;                                                <b>Fax : </b> <span>' + arr[i].fax + ' </span>                                    </p>                                    <div class="text-right">                                        <a class="text-left btn btn-light" href="/cari/toplantiEkle/35"><i class="fa fa-calendar"></i> Toplantı Ayarla</a>                                    <a class="btn btn-primary" href="/cari/Detay/' + arr[i].CariId + '"><i class="fa fa-search"></i> detaylar</a> <a class="btn btn-warning " href="/cari/duzenle/' + arr[i].CariId + '"><i class="fa fa-pencil"></i> düzenle</a> <button data-popup=".popup-del " class="btn btn-danger open-popup " onclick="delIdFunction(' + arr[i].CariId + ')"> <i class="fa fa-trash"></i> sil </button>                                    </div>   </div>                            </div>                        </div>                            </div >';
            }
            $(".allItems").html(tr_str);
        },
        error: function (jqXHR, status, err) {
            alert("Local error callback.");
        }
    });
}

