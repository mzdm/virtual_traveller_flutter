/// This should save Most Travelled/Booked & Recommended Flights
/// API responses. These are on Home Page so it would be calling API
/// very often -> would consume a lot API quota.
///
///
/// **Refresh should be only done based on these conditions:**
///   - a) 5 days since data saved
///   - b) OR user changed the departure destination, after that again applies a) rule
///   - c) there's no data saved
class ApiResponsePrefs {}