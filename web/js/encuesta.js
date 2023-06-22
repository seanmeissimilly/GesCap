function calcular() {
  var num6 = parseFloat(document.getElementById("num6").value);
  var num7 = parseFloat(document.getElementById("num7").value);
  var num8 = parseFloat(document.getElementById("num8").value);
  var num9 = parseFloat(document.getElementById("num9").value);
  var num10 = num6 + num7 + num8 + num9;

  document.getElementById("num10").value = num10;

  var num27 = parseFloat(document.getElementById("num27").value);
  var num28 = parseFloat(document.getElementById("num28").value);
  var num29 = parseFloat(document.getElementById("num29").value);
  var num30 = parseFloat(document.getElementById("num30").value);
  var num31 = num30 + num29 + num28 + num27;

  document.getElementById("num31").value = num31;

  var num11 = parseFloat(document.getElementById("num11").value);
  var num12 = parseFloat(document.getElementById("num12").value);
  var num13 = parseFloat(document.getElementById("num13").value);
  var num14 = parseFloat(document.getElementById("num14").value);
  var num15 = parseFloat(document.getElementById("num15").value);
  var num16 = parseFloat(document.getElementById("num16").value);
  var num17 = num11 + num12 + num13 + num14 + num15 + num16;

  document.getElementById("num17").value = num17;

  var num18 = parseFloat(document.getElementById("num18").value);
  var num19 = parseFloat(document.getElementById("num19").value);
  var num20 = parseFloat(document.getElementById("num20").value);
  var num21 = parseFloat(document.getElementById("num21").value);
  var num22 = parseFloat(document.getElementById("num22").value);
  var num23 = parseFloat(document.getElementById("num23").value);
  var num24 = num23 + num22 + num21 + num20 + num19 + num18;

  document.getElementById("num24").value = num24;

  var num26 = num10 + num17;
  var num25 = num24 + num31;
  document.getElementById("num25").value = num25;
  document.getElementById("num26").value = num26;
}
