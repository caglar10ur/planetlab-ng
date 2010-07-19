#!/bin/bash

func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar capabilities CAP_NET_ADMIN
func "planetlab-02.cs.princeton.edu" call nm DeleteSliceTag princeton_caglar capabilities CAP_NET_ADMIN

func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar codemux abc,8080
func "planetlab-02.cs.princeton.edu" call nm DeleteSliceTag princeton_caglar codemux abc,8080

func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar cpu_share 2
func "planetlab-02.cs.princeton.edu" call nm DeleteSliceTag princeton_caglar cpu_share 2

func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar disk_max 20000000
func "planetlab-02.cs.princeton.edu" call nm DeleteSliceTag princeton_caglar disk_max 20000000

func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar enabled 0
func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar enabled 1
func "planetlab-02.cs.princeton.edu" call nm DeleteSliceTag princeton_caglar enabled 1

func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar ip_addresses 128.112.139.25
func "planetlab-02.cs.princeton.edu" call nm DeleteSliceTag princeton_caglar ip_addresses 128.112.139.25

func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar openfd_min 64000
func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar openfd_soft 64000
func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar openfd_hard 64000
func "planetlab-02.cs.princeton.edu" call nm DeleteSliceTag princeton_caglar openfd_min 64000
func "planetlab-02.cs.princeton.edu" call nm DeleteSliceTag princeton_caglar openfd_soft 64000
func "planetlab-02.cs.princeton.edu" call nm DeleteSliceTag princeton_caglar openfd_hard 64000

func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar vsys_net 1
func "planetlab-02.cs.princeton.edu" call nm DeleteSliceTag princeton_caglar vsys_net 1

func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar vsys fd_bmsocket
func "planetlab-02.cs.princeton.edu" call nm DeleteSliceTag princeton_caglar vsys fd_bmsocket

func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar net_min_rate 5000
func "planetlab-02.cs.princeton.edu" call nm DeleteSliceTag princeton_caglar net_min_rate 5000

func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar ip_addresses 128.112.139.25,TEST
func "planetlab-02.cs.princeton.edu" call nm AddSliceTag princeton_caglar ip_addresses 128.112.139.25
func "planetlab-02.cs.princeton.edu" call nm DeleteSliceTag princeton_caglar ip_addresses 128.112.139.25

