// utils/Log.js
function log(msg) {
    console.log(
        Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss.zzz"),
        msg
    )
}
