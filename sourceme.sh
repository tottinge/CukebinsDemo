if [ -f ${CUKEBINS_ROOT}/build/src/libCukeBins.a ]; then
    export CUKE_LIB=${CUKEBINS_ROOT}/build/src/libCukeBins.a 
    export CUKE_INCLUDES=${CUKEBINS_ROOT}/include
fi
if [ -d "${GTEST_ROOT}/include" ] ; then
    export GTEST_INCLUDES="${GTEST_ROOT}/include"
    export GTEST_LIB="${GTEST_ROOT}/lib/libgtest.a"
fi

echo "CUKE_LIB=${CUKE_LIB:-unset}"
echo "CUKE_INCLUDES=${CUKE_INCLUDES:-unset}"
echo "GTEST_LIB=${GTEST_LIB:-unset}"

compile() {
    CUKE_BOOST_DEPS='-lboost_thread -lboost_regex -lboost_system -lboost_date_time'
    CUKE_LIB=${CUKE_LIB:-/usr/lib/libCukeBins.a}
    GTEST_LIB=${GTEST_LIB:-/usr/lib/libgtest.a}
    ( 
        cd features/step_definitions
        g++ cuke_fixture.cpp blackjack.cpp \
            ${CUKE_LIB} ${GTEST_LIB} \
            -I${GTEST_INCLUDES} \
            -I${CUKE_INCLUDES} \
            -lboost_thread-mt -lboost_regex-mt -lboost_system-mt -lboost_date_time-mt \
            -o blackjack_steps
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

