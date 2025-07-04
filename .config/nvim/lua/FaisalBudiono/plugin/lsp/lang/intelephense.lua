return {
    autostart = true,
    settings = {
        intelephense = {
            stubs = {
                "Core",
                "date",
                "libxml",
                "openssl",
                "pcre",
                "zlib",
                "filter",
                "hash",
                "json",
                "pcntl",
                "random",
                "Reflection",
                "SPL",
                "session",
                "standard",
                "sodium",
                "mysqlnd",
                "PDO",
                "xml",
                "calendar",
                "ctype",
                "curl",
                "dom",
                "mbstring",
                "FFI",
                "fileinfo",
                "ftp",
                "gd",
                "gettext",
                "iconv",
                "igbinary",
                "exif",
                "mysqli",
                "pdo_mysql",
                "Phar",
                "posix",
                "readline",
                "shmop",
                "SimpleXML",
                "sockets",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tokenizer",
                "xmlreader",
                "xmlwriter",
                "xsl",
                "redis",
                "Zend OPcache",
            },
            -- @todo make toggleable setting for PHP
            environment = {
                phpVersion = "7.4",
            },
        },
    },
}
