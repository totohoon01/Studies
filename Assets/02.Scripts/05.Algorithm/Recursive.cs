using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Recursive : MonoBehaviour {
  // Start is called before the first frame update
  void Start() {
    WhatIsRecursive(10);
    Debug.Log(SummationToN_Recursive(10));
    Debug.Log(SummationToN_Equation(10));
    Debug.Log(GCD(51, 15));
  }

  void WhatIsRecursive(int count) {
    if (count > 0) {
      Debug.Log("재귀가 뭐냐구요? 재귀란 말이죠.." + count);
      WhatIsRecursive(count - 1);
    } else {
      return;
    }
    Debug.Log("이런거랍니다." + count);
  }

  int SummationToN_Recursive(int n) {
    if (n == 0) return 0;
    return n + SummationToN_Recursive(n - 1);
  }

  int SummationToN_Equation(int n) {
    return (int)n * (n + 1) / 2;
  }

  int GCD(int m, int n) {
    if (n == 0) return m;
    return GCD(n, m % n);
  }
}
