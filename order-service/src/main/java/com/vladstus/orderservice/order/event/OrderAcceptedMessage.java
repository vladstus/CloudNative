package com.vladstus.orderservice.order.event;

public record OrderAcceptedMessage(
        Long orderId
) {
}
