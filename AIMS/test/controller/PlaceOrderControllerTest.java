package controller;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import static org.junit.jupiter.api.Assertions.*;

class PlaceOrderControllerTest{
    private PlaceOrderController placeOrderController;

    @BeforeEach
    void setUp(){
        placeOrderController = new PlaceOrderController();
    }

    @AfterEach
    void tearDown(){
    }

    @ParameterizedTest
    @CsvSource({"0123456789, true", "01234, false", ", false", "abcdefghik, false"})
    void validatePhoneNumber(String phone, boolean expect){
        boolean isValid = placeOrderController.validatePhoneNumber(phone);

        assertEquals(expect, isValid);
    }

    @ParameterizedTest
    @CsvSource({"Hanoi, Vietnam, true", "hfd8*&TT, false", ", false"})
    void validateAddress(String address, boolean expect){
       boolean isValid = placeOrderController.validateAddress(address);

        assertEquals(expect, isValid);
    }

    @ParameterizedTest
    @CsvSource({"Nguyen Van A, true", "hfd8*&TT, false", "Nguyen 12, false"})
    void validateName(String name, boolean expect){
        boolean isValid = placeOrderController.validateName(name);

        assertEquals(expect, isValid);
    }

}