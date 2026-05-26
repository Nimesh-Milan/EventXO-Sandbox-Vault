package com.sliit.eventbooking.services;

import com.sliit.eventbooking.models.Event;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Service
public class EventMergeSort {

    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMM d, yyyy", Locale.ENGLISH);

    public void sort(List<Event> events) {
        if (events == null || events.size() <= 1) {
            return;
        }
        mergeSort(events, 0, events.size() - 1);
    }

    private void mergeSort(List<Event> events, int left, int right) {
        if (left < right) {
            int mid = (left + right) / 2;
            mergeSort(events, left, mid);
            mergeSort(events, mid + 1, right);
            merge(events, left, mid, right);
        }
    }

    private void merge(List<Event> events, int left, int mid, int right) {
        List<Event> leftList = new ArrayList<>(events.subList(left, mid + 1));
        List<Event> rightList = new ArrayList<>(events.subList(mid + 1, right + 1));

        int i = 0, j = 0, k = left;

        while (i < leftList.size() && j < rightList.size()) {
            try {
                LocalDate dateLeft = LocalDate.parse(leftList.get(i).getDate(), formatter);
                LocalDate dateRight = LocalDate.parse(rightList.get(j).getDate(), formatter);

                if (dateLeft.isBefore(dateRight) || dateLeft.isEqual(dateRight)) {
                    events.set(k++, leftList.get(i++));
                } else {
                    events.set(k++, rightList.get(j++));
                }
            } catch (DateTimeParseException e) {
                // Handle error or default to string comparison if parsing fails
                if (leftList.get(i).getDate().compareTo(rightList.get(j).getDate()) <= 0) {
                    events.set(k++, leftList.get(i++));
                } else {
                    events.set(k++, rightList.get(j++));
                }
            }
        }

        while (i < leftList.size()) {
            events.set(k++, leftList.get(i++));
        }
        while (j < rightList.size()) {
            events.set(k++, rightList.get(j++));
        }
    }
}