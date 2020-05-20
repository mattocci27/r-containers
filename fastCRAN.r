cranometer <- function(mirrors, url = "src/base/COPYING", cacheOK = FALSE) {
  old <- options(timeout = 10)
  on.exit(options(old))

  urls <- paste0(mirrors$URL, url)
  times <- vapply(urls, time_download, cacheOK = cacheOK,
    FUN.VALUE = numeric(1), USE.NAMES = FALSE)
  names(times) <- mirrors$Name

  times
}

#' Returns time in kilobytes / s
time_download <- function(url, cacheOK = FALSE) {
  cat(".")
  dest <- tempfile()
  on.exit(file.remove(dest))

  down <- function(src) {
    download.file(src, dest, cacheOK = cacheOK, method = "libcurl", quiet = TRUE)
  }

  time <- tryCatch(system.time(down(url))[["elapsed"]],
    error = function(e) NA)

  file.info(dest)$size / time / 1024
}

rowMax <- function(x) apply(x, 1, max, na.rm = TRUE)

apply(bigger, 1, mean)


# # Eliminate the slowest mirrors (<20 kbs from best of three)
#
# mirrors <- getCRANmirrors(all = FALSE, local.only = FALSE)
# # About 20k
# three <- replicate(3, cranometer(mirrors, url = "/src/base/COPYING"))
# best <- rowMax(three)
# # Check these look reasonable
# names(best)[best <= 20]
# dput(names(best)[best > 20])

reasonable <- c("0-Cloud", "Argentina (La Plata)", "Argentina (Mendoza)", "Austria",
"Belgium", "Brazil (PR)", "Brazil (RJ)", "Brazil (SP 1)", "Brazil (SP 2)",
"Canada (BC)", "Canada (NS)", "Canada (ON)", "Canada (QC 1)",
"Canada (QC 2)", "Chile", "Colombia (Bogota)", "Colombia (Cali)",
"Denmark", "Ecuador", "France (Lyon 1)", "France (Lyon 2)", "France (Montpellier)",
"France (Paris 1)", "France (Paris 2)", "Germany (Berlin)", "Germany (Bonn)",
"Germany (Goettingen)", "Greece", "Hungary", "Indonesia", "Ireland",
"Italy (Milano)", "Italy (Padua)", "Japan (Tsukuba)", "Korea (Seoul 1)",
"Latvia", "Mexico (Mexico City)", "Mexico (Texcoco)", "Netherlands (Amsterdam)",
"Netherlands (Utrecht)", "New Zealand", "Norway", "Poland", "Slovakia",
"Sweden", "Switzerland", "Taiwan (Taichung)", "UK (Bristol)",
"UK (London)", "UK (St Andrews)", "USA (CA 1)", "USA (CA 2)",
"USA (IA)", "USA (IN)", "USA (KS)", "USA (MD)", "USA (MI)", "USA (MO)",
"USA (OH)", "USA (OR)", "USA (PA 2)", "USA (TN)", "USA (TX 1)",
"USA (WA 1)", "USA (WA 2)", "Venezuela")

reasonable <- c(
"0-Cloud [https]",
"Australia (Canberra) [https]",
"Australia (Melbourne 2) [https]",
"Austria [https]",
"Belgium (Ghent) [https]",
"Brazil (PR) [https]",
"Brazil (SP 1) [https]",
"Bulgaria [https]",
"Canada (MB) [https]",
"Canada (ON)",
"Chile (Temuco) [https]",
"China (Hefei) [https]",
"China (Guangzhou) [https]",
"China (Shanghai) [https]",
"Costa Rica [https]",
"Denmark [https]",
"Ecuador (Cuenca) [https]",
"El Salvador",
"France (Lyon 1) [https]",
"France (Marseille) [https]",
"France (Paris 1)",
"Germany (Göttingen) [https]",
"Germany (Regensburg) [https]",
"Hungary [https]",
"Indonesia (Jakarta) [https]",
"Ireland [https]",
"Italy (Padua) [https]",
"Japan (Yonezawa) [https]",
"Korea (Gyeongsan-si) [https]",
"Korea (Seoul 2)",
"Malaysia",
"Morocco [https]",
"Norway [https]",
"Portugal (Lisbon) [https]",
"Russia [https]",
"South Africa (Johannesburg) [https]",
"Spain (Madrid) [https]",
"Switzerland [https]",
"Taiwan (Taipei) [https]",
"Turkey (Denizli) [https]",
"UK (Bristol) [https]",
"USA (IA) [https]",
"USA (KS) [https]",
"USA (MI 2) [https]",
"USA (NC)",
"USA (OR) [https]",
"USA (PA 2)",
"USA (TX 1) [https]",
"Uruguay [https]"
)


all <- getCRANmirrors(all = FALSE, local.only = FALSE)
#mirrors <- subset(all, Name %in% reasonable)
mirrors <- subset(all, Country == "China" | Country == "0-Cloud")
mirrors <- subset(all, Country == "China")
#mirrors <- subset(all, Country == "USA")


#system("curl https://freegeoip.app/xml/")

# About 100k
bigger <- replicate(3, cranometer(mirrors, url = "src/base/FAQ"))
cat(paste(
  rownames(bigger), "|",
  round(apply(bigger, 1, mean), 2), "KB/s\n"))


cat("\n")
dput(bigger)

speeds <- list(
  China = structure(c(38.959928166949, 150.389360022681, 101.221086257614,
  142.981017164427, 82.0498840547724, 137.723114991091, 128.146342094378,
  154.80078125, 14.8580222597264, 166.333217675479, 79.4121654839267,
  134.375678168398, 67.7366312354165, 150.976054535109, 17.7225745592272,
  242.381181497891, 85.873214450808, 135.000681322654), .Dim = c(6L,
  3L), .Dimnames = list(c("China (Beijing) [https]", "China (Hefei) [https]",
  "China (Hong Kong) [https]", "China (Guangzhou) [https]", "China (Lanzhou) [https]",
  "China (Shanghai) [https]"), NULL))
  )

rowMaxes <- function(x) apply(x, 1, max, na.rm = TRUE)
rowMedians <- function(x) apply(x, 1, median, na.rm = TRUE)
speeds <- speeds[order(names(speeds))]

# Find best speed for each mirror in each location
best <- lapply(speeds, rowMaxes)
in_one <- do.call("cbind", best)





---------------------------------------------------------------------------------------------------------
| Rank | Mirror URL                         | Available? | Updating? | Last updated      | Bandwidth    |
---------------------------------------------------------------------------------------------------------
|    1 | http://mirrors.cqu.edu.cn/ubuntu   | Yes        | No        | 24 minutes behind | 60.18 KB/s   |
|    2 | http://mirrors.tuna.tsinghua.ed... | Yes        | No        | 2 hours behind    | 180.52 KB/s  |
|    3 | https://mirrors.bfsu.edu.cn/ubuntu | Yes        | No        | 2 hours behind    | 111.89 KB/s  |
|    4 | http://mirrors.ustc.edu.cn/ubuntu  | Yes        | No        | 4 hours behind    | 178.31 KB/s  |
|    5 | http://mirrors.nju.edu.cn/ubuntu   | Yes        | No        | 4 hours behind    | 85.45 KB/s   |
|    6 | http://mirrors.cn99.com/ubuntu     | Yes        | No        | 4 hours behind    | 82.53 KB/s   |
|    7 | http://mirrors.njupt.edu.cn/ubuntu | Yes        | No        | 4 hours behind    | 41.74 KB/s   |
|    8 | http://mirrors.dgut.edu.cn/ubuntu  | Yes        | No        | 7 hours behind    | 90.11 KB/s   |
|    9 | http://mirrors.aliyun.com/ubuntu   | Yes        | No        | 7 hours behind    | 69.2 KB/s    |
|   10 | http://mirrors.huaweicloud.com/... | Yes        | No        | 11 hours behind   | 78.16 KB/s   |
|   11 | http://ftp.sjtu.edu.cn/ubuntu      | Yes        | No        | 18 hours behind   | 105.61 KB/s  |
|   12 | http://mirrors.yun-idc.com/ubuntu  | Yes        | No        | 18 hours behind   | 70.03 KB/s   |
|   13 | http://mirror.lzu.edu.cn/ubuntu    | Yes        | No        | 20 hours behind   | 226.26 KB/s  |
|   14 | https://mirror.lzu.edu.cn/ubuntu   | Yes        | No        | 20 hours behind   | 152.54 KB/s  |
|   15 | http://mirrors.sohu.com/ubuntu     | No         | No        | Unknown           | 17.0 bytes/s |
|   16 | http://linux.xjtuns.cn/ubuntu      | No         | No        | Unknown           | Unknown      |
|   17 | http://archive.ubuntu.com/ubuntu   | No         | No        | Unknown           | Unknown      |
---------------------------------------------------------------------------------------------------------

cat(paste(
  rownames(bigger), "|",
  round(apply(bigger, 1, mean), 2), "KB/s\n"))

