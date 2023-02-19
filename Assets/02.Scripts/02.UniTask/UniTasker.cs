using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Cysharp.Threading.Tasks;

public class UniTasker : MonoBehaviour {
  private TestClass Test1 = new();
  // Start is called before the first frame update
  void Start() {
    WaitNSeconds(5, Test1.LogSomething).Forget();
    WaitConditon(Test1).Forget();
    WaitFuntionDone().Forget();

    CallForNSeconds(1).Forget();
  }

  //Wait N-seconds
  private async UniTaskVoid WaitNSeconds(int n, Action action) {
    await UniTask.Delay(TimeSpan.FromSeconds(n), cancellationToken: this.GetCancellationTokenOnDestroy());
    action();
  }

  //Wait Bool Condition
  private async UniTaskVoid WaitConditon(TestClass testClass) {
    await UniTask.WaitUntil(() => testClass.isWaited == true);
    Debug.Log("Wait Done..");
  }

  private async UniTaskVoid WaitFuntionDone() {
    await UniTask.WaitUntil(IsConditoned);
    Debug.Log(2);
  }

  bool IsConditoned() {
    Debug.Log(1);
    return true;
  }

  private async UniTaskVoid CallForNSeconds(int duration) {
    while (true) {
      await UniTask.Delay(TimeSpan.FromSeconds(duration));
      Debug.Log("Tick");
    }
  }
}

public class TestClass {
  public bool isWaited = false;
  public void LogSomething() {
    Debug.Log("some log...");
    isWaited = true;
  }
}