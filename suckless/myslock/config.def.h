/* user and group to drop privileges to */
static const char *user  = "yv";
static const char *group = "yv";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#282a36",     /* after initialization */
	[INPUT] =  "#6272a4",   /* during input */
	[FAILED] = "#ff5555",   /* wrong password */
	[CAPS] = "#ffb86c",         /* CapsLock on */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* default message */
static const char * message = "Screen Locked, type password:";

/* text color */
static const char * text_color = "#f8f8f2";

/* text size (must be a valid size) */
static const char * font_name = "-misc-hack-bold-r-normal--0-0-0-0-m-0-iso8859-15";
