using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class VideoStatements : MonoBehaviour {
  private Dictionary<string, PlaysData> plays = new();
  private List<InvoicesData> invoices = new();

  void Start() {
    string playsJson = Json.ReadJson("Resources/", "plays.json");
    plays = Json.FromJson<Dictionary<string, PlaysData>>(playsJson);

    string invoicesJson = Json.ReadJson("Resources/", "invoices.json");
    invoices = Json.FromJson<List<InvoicesData>>(invoicesJson);
  }
}

public class PlaysData {
  public string name;
  public string type;
}

public class InvoicesData {
  public string customer;
  public List<Performance> performances;

  public class Performance {
    public string playID;
    public int audience;
  }
}