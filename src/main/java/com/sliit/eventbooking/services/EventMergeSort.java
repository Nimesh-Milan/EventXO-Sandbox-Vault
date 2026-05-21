package com.sliit.eventbooking.services;

import com.sliit.eventbooking.models.Event;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EventMergeSort {

    public void sort(List<Event> events) {
        if (events == null || events.size() <= 1) {
            return;
        }
        
        List<Event> left = new ArrayList<>();
        List<Event> right = new ArrayList<>();
        int middle = events.size() / 2;

        for (int i = 0; i < middle; i++) {
            left.add(events.get(i));
        }
        for (int i = middle; i < events.size(); i++) {
            right.add(events.get(i));
        }

        sort(left);
        sort(right);
        merge(events, left, right);
    }

    private void merge(List<Event> result, List<Event> left, List<Event> right) {
        int i = 0;
        int j = 0;
        int k = 0;

        while (i < left.size() && j < right.size()) {
            // Compare dates lexicographically (YYYY-MM-DD works well with String comparison)
            if (left.get(i).getDate().compareTo(right.get(j).getDate()) <= 0) {
                result.set(k, left.get(i));
                i++;
            } else {
                result.set(k, right.get(j));
                j++;
            }
            k++;
        }

        while (i < left.size()) {
            result.set(k, left.get(i));
            i++;
            k++;
        }

        while (j < right.size()) {
            result.set(k, right.get(j));
            j++;
            k++;
        }
    }
}
