
<img src="http://lispnyc.org/static/images/theme-lispnyc.png" alt="lispnyc logo" title="LispNYC's webserver" />

# LispNYC's Webapplication Server

The highly acclaimed lightweight Jetty webserver is configured for the
use with our LispNYC Homebase Webapp, also included is the Pebble Blog
and JSP Wiki webapps.

## Requirements

  * Java
  * deploy the [LispNYC Homebase Webapp](https://github.com/lispnyc/lispnyc-homebase)

## Running

After the [LispNYC Homebase Webapp](https://github.com/lispnyc/lispnyc-homebase) has been built and deployed here, just run:

  ./start
  
Then hit [http://localhost:8000](http://localhost:8000)

## Jetty Details

The [Jetty Webserver](http://jetty.codehaus.org/jetty/contains) executes THREE webapps:

* [LispNYC Homebase Webapp](https://github.com/lispnyc/lispnyc-homebase) 
* [Pebble Blog](http://pebble.sourceforge.net/)
* [JSP Wiki](http://www.jspwiki.org/)
 
Because the initial homepage of LispNYC is dynamic, the Homebase Webapp is the *main* application and thus runs as the main context.  This means that by default it intercepts all requests including ones for things like CSS, HTML and images ...which is not necessarially what we want 100% of the time.

There are several techniques to handle this, the one we chose is to set up a seperate context for static files and serve it up there.  It's also a scaling technique: using Apache or a CDN to serve up static files.

    uri path         handled by
    --------         ----------
    /static/         Jetty WebServer
    /blog/           Pebble Blog WebApp
    /wiki/           JSP Wiki WebApp
    /*               Homebase Webapp

# Pebble Details

The super-secret password for the default accounts is *password*
