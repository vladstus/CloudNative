package com.vladstus.orderservice.order.event;

public record OrderDispatchedMessage(
        Long orderId
) {
}
