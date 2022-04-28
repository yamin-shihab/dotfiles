/* user and group to drop privileges to */
static const char *user  = "yamin";
static const char *group = "yamin";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#282a36",     /* after initialization */
	[INPUT] =  "#6272a4",   /* during input */
	[FAILED] = "#ff5555",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* time in seconds to cancel lock with mouse movement */
static const int timetocancel = 4;
