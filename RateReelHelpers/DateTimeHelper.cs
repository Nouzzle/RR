public class DateTimeHelper
{
    // Format tanggal ke yyyy-MM-dd
    public static string FormatDate(DateTime date)
    {
        return date.ToString("yyyy-MM-dd");
    }

    // Convert waktu ke timezone lain
    public static DateTime ConvertToTimeZone(DateTime dateTime, TimeZoneInfo timeZone)
    {
        return TimeZoneInfo.ConvertTime(dateTime, timeZone);
    }
}
