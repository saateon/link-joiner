# LinkJoiner

ابزار ویندوزی. چند خط لینک را در یک خط می‌گذارد. بین لینک‌ها یک فاصله می‌گذارد.

## نتیجه

ورودی:

```
https://a.com
https://b.com
https://c.com
```

خروجی:

```
https://a.com https://b.com https://c.com
```

## نصب

نصب لازم نیست. ویندوز ۱۰ یا ۱۱ کافی است. PowerShell از قبل در ویندوز هست.

1. ZIP را باز کن.
2. پوشه را هر جا می‌خواهی بگذار.

## استفاده

**راه اول: دوبار کلیک**
1. لینک‌ها را در `input\links.txt` بگذار. هر لینک یک خط.
2. روی `join-links.cmd` دوبار کلیک کن.

**راه دوم: کشیدن و رها کردن**
1. فایل متنی خودت را بکش روی `join-links.cmd`.

**راه سوم: خط فرمان**
```
join-links.cmd C:\path\to\my-links.txt
```

## خروجی

- فایل جدید کنار فایل ورودی ساخته می‌شود. نامش `نام-فایل.joined.txt` است.
- متن در کلیپ‌بورد هم کپی می‌شود. می‌توانی مستقیم Paste کنی.

## گزینه‌ها

برای گزینه‌ها، `src\Join-Links.ps1` را مستقیم اجرا کن.

| گزینه | کار | پیش‌فرض |
|---|---|---|
| `-InputPath` | فایل ورودی | `input\links.txt` |
| `-OutputPath` | فایل خروجی | کنار ورودی |
| `-Separator` | جداکننده | یک فاصله |
| `-NoClipboard` | کپی نکردن در کلیپ‌بورد | خاموش |

مثال با جداکننده‌ی ویرگول:
```
powershell -File src\Join-Links.ps1 -Separator ","
```

## ساختار پروژه

```
link-joiner/
├─ join-links.cmd      راه‌انداز ساده
├─ src/Join-Links.ps1  منطق اصلی
├─ input/links.txt     نمونه‌ی ورودی
├─ docs/               راهنمای عیب‌یابی
├─ README.md
├─ LICENSE
└─ .gitignore
```

## عیب‌یابی

جزئیات در [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md).

## مجوز

MIT. جزئیات در `LICENSE`.
