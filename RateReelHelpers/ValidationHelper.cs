using System.Text.RegularExpressions;

public class ValidationHelper
{
    // Validasi username: min 3 karakter, gak perlu ada angka
    public static bool IsValidUsername(string username)
    {
        // Cek username minimal 3 karakter
        if (username.Length < 3) 
        {
            return false;  // Username terlalu pendek
        }
        
        // Username gak perlu ada angka, jadi regex-nya hanya cek panjangnya
        var regex = new Regex(@"^[a-zA-Z0-9]{3,}$");  // Cuma boleh huruf dan angka
        return regex.IsMatch(username); // Cek apakah username hanya mengandung huruf dan angka
    }

    // Validasi password: min 5 karakter, harus ada angka
    public static bool IsStrongPassword(string password)
    {
        // Password minimal 5 karakter
        if (password.Length < 5)
        {
            return false;  // Password terlalu pendek
        }

        // Password harus ada angka
        var regex = new Regex(@"^(?=.*\d)[A-Za-z\d]{5,}$"); // Harus ada angka
        return regex.IsMatch(password);
    }
}
