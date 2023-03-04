using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OOP_Example : MonoBehaviour {
  void Start() {
    float c = 12.5f;

    //절차 지향 -> 프로시저와 데이터가 분리ㄷ
    toFfromC(c);
    toKfromC(c);

    //객체 지향
    Temperature temp = new Temperature(c);
    temp.ToCelcius();
    temp.ToKelvin();
    temp.ToFahrenheit();
  }

  float toFfromC(float c) {
    return (c * 9 / 5) + 32;
  }
  float toKfromC(float c) {
    return c - 273.15f;
  }
}

public class Temperature {
  float c = 0.0f;
  public float C { get; set; }

  public Temperature(float c) {
    this.c = c;
  }

  public float ToCelcius() {
    return c;
  }
  public float ToKelvin() {
    return c - 273.15f;
  }
  public float ToFahrenheit() {
    return (c * 9 / 5) + 32;
  }
}
