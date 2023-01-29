<?php

    session_start();

    require "includes/functions.php";

    // make sure the user is logged in
    if ( isloggedIn()  ) {
        // delete the user's session data
        logout();
        // redirect user back to index
        header( 'Location: /login' );
        exit;
    } else {
        // redirect to login page if user is not logged in
        header( 'Location: /login' );
        exit;
    }