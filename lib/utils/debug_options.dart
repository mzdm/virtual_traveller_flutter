class DebugOptions {
  /// Set to `true` if the app is in the testing and/or debugging mode.
  ///
  /// If it is set to `true` then it influences following:
  ///   - uses local Mocked REST API in order to save API calls quota
  static const quotaSaveMode = true;

  /// **Amadeus API related**
  ///
  /// If set to `false` then app will use free Self-Service quota.
  ///
  /// In the production mode it should be turned on when your application is
  /// ready to be deployed to the Real World.
  ///
  /// [Learn more](https://developers.amadeus.com/self-service/apis-docs/guides/moving%20to%20production-743)
  static const productionMode = false;
}