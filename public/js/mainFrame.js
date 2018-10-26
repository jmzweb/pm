// store
var mainFrameNavInvestData= {
    Forward: [
        {id: 0, name: '初选', url: ''},
        {id: 1, name: '初选', url: ''},
        {id: 2, name: '初选', url: ''},
        {id: 3, name: '初选', url: ''},
        {id: 4, name: '初选', url: ''},
        {id: 5, name: '初选', url: ''},
        {id: 6, name: '初选', url: ''},
        {id: 7, name: '初选', url: ''},
        {id: 8, name: '初选', url: ''},
        {id: 9, name: '初选', url: ''},
    ],
    after: [
        {id: 0, name: '初选', url: ''},
        {id: 1, name: '初选', url: ''},
        {id: 2, name: '初选', url: ''},
        {id: 3, name: '初选', url: ''},
        {id: 4, name: '初选', url: ''},
        {id: 5, name: '初选', url: ''},
        {id: 6, name: '初选', url: ''},
        {id: 7, name: '初选', url: ''},
        {id: 8, name: '初选', url: ''},
        {id: 9, name: '初选', url: ''},
    ],
    exit: [
        {id: 0, name: '初选', url: ''},
        {id: 1, name: '初选', url: ''},
        {id: 2, name: '初选', url: ''},
        {id: 3, name: '初选', url: ''},
        {id: 4, name: '初选', url: ''},
        {id: 5, name: '初选', url: ''},
        {id: 6, name: '初选', url: ''},
        {id: 7, name: '初选', url: ''},
        {id: 8, name: '初选', url: ''},
        {id: 9, name: '初选', url: ''},
    ],

}
var latelyProject = [
    {id: 0, title: 'xxxxxxx', status: 'xxxx',total: '200', type: 'xxx', time: 123456789, content: 'xxxxxxx' },
]

function depech (i ,data, callback) {
    if ( i> data.length) {

    } else {
        callback(data[i]);
        i++;
        depech(i, data)
    }
}

function views (title, data, type) {
    var section = $('<div></div>')
    var header = $('<header>'+title+'</header>')
    var content = $('<div></div>')
    var _html = ''
    depech(0, data, function (item) {
        _html += '<div data-index="'+type+'_'+item.id+'"><img src='+item.url+'/><span>'+item.name+'</span></div>'
    })
    content.html(_html)
    section.append(header)
    section.append(content)
    return section
}

function laterlyPro (title, data) {
    var section = $('<div></div>')
    var header = $('<header>'+title+'</header>')
    var content = $('<div></div>')
    var _html = ''
    depech(0, data, function (item) {
        _html += '<div data-index=laterlyPro_"'+item.id+'">' +
            '<h4>'+item.title+'<a>'+item.status+'</a></h4>' +
            '<ul>' +
            '<li><span>融资额度</span>'+item.total+'</li>' +
            '<li><span>融资方式</span>'+item.type+'</li>' +
            '<li><span>开始时间</span>'+item.time+'</li>' +
            '</ul>' +
            '<div>'+item.content+'</div>' +
            '</div>'
    })
    content.html(_html)
    section.append(header)
    section.append(content)
    return section
}

$(function(){
    var secContent = $('#secContent');

    var _forward = views('投前管理', mainFrameNavInvestData['Forward'], 'forward')
    var _after = views('投后管理', mainFrameNavInvestData['after'], 'after')
    var exit = views('项目退出', mainFrameNavInvestData['exit'], 'exit')

    var _latelyProject = laterlyPro('最近项目', latelyProject)
    // mainFrameNavInvestData

    secContent.append(_forward)
    secContent.append(_after)
    secContent.append(exit)
    secContent.append(_latelyProject)


})