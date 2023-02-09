using System.IO;
using Newtonsoft.Json;

public static class Json {
  public static string ReadJson(string path, string fileName) {
    return File.ReadAllText(path + fileName);
  }
  public static void WriteJson(string jsonString, string fileName) {
    File.WriteAllText("Resources/" + fileName, jsonString);
  }

  public static string ToJson<T>(T data) {
    return JsonConvert.SerializeObject(data);
  }

  public static T FromJson<T>(string jsonString) {
    return JsonConvert.DeserializeObject<T>(jsonString);
  }
}