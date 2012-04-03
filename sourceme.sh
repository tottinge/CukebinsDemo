
compile() {
    CUKE_BOOST_DEPS='-lboost_thread -lboost_regex -lboost_system -lboost_date_time'
    CUKE_LIB=/usr/lib/libCukeBins.a
    GTEST_LIB=/usr/lib/libgtest.a
    ( cd features/step_definitions; 
        g++ cuke_fixture.cpp blackjack.cpp $CUKE_LIB $GTEST_LIB $CUKE_BOOST_DEPS -o blackjack_steps
    )  
}

run_cuke(){     
    args=${*:-'--tags=~@wip --tags=~@ignore'}
    echo "Args: $args" >&2
    ./features/step_definitions/blackjack_steps &      
    cucumber ${args}
}

go() {
    ( set -x; compile && run_cuke $* ; set +x )
}

