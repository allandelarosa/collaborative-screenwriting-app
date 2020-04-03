let d = new Date()
Date.prototype.formatMMDDYYYY = function () {
    return (this.getMonth() + 1) +
        "/" + this.getDate() +
        "/" + this.getFullYear();
}
console.log(d.formatMMDDYYYY())