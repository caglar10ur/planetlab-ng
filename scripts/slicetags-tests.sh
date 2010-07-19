#!/bin/bash

func "*" call nm AddSliceTag princeton_caglar capabilities CAP_NET_ADMIN
func "*" call nm DeleteSliceTag princeton_caglar capabilities CAP_NET_ADMIN

func "*" call nm AddSliceTag princeton_caglar codemux abc,8080
func "*" call nm DeleteSliceTag princeton_caglar codemux abc,8080

func "*" call nm AddSliceTag princeton_caglar cpu_share 2
func "*" call nm DeleteSliceTag princeton_caglar cpu_share 2

func "*" call nm AddSliceTag princeton_caglar disk_max 20000000
func "*" call nm DeleteSliceTag princeton_caglar disk_max 20000000

func "*" call nm AddSliceTag princeton_caglar enabled 0
func "*" call nm AddSliceTag princeton_caglar enabled 1
func "*" call nm DeleteSliceTag princeton_caglar enabled 1

func "*" call nm AddSliceTag princeton_caglar ip_addresses 128.112.139.25
func "*" call nm DeleteSliceTag princeton_caglar ip_addresses 128.112.139.25

func "*" call nm AddSliceTag princeton_caglar openfd_min 64000
func "*" call nm AddSliceTag princeton_caglar openfd_soft 64000
func "*" call nm AddSliceTag princeton_caglar openfd_hard 64000
func "*" call nm DeleteSliceTag princeton_caglar openfd_min 64000
func "*" call nm DeleteSliceTag princeton_caglar openfd_soft 64000
func "*" call nm DeleteSliceTag princeton_caglar openfd_hard 64000

func "*" call nm AddSliceTag princeton_caglar vsys_net 1
func "*" call nm DeleteSliceTag princeton_caglar vsys_net 1

func "*" call nm AddSliceTag princeton_caglar vsys fd_bmsocket
func "*" call nm DeleteSliceTag princeton_caglar vsys fd_bmsocket

func "*" call nm AddSliceTag princeton_caglar net_min_rate 5000
func "*" call nm DeleteSliceTag princeton_caglar net_min_rate 5000

func "*" call nm AddSliceTag princeton_caglar ip_addresses 128.112.139.25,TEST
func "*" call nm AddSliceTag princeton_caglar ip_addresses 128.112.139.25
func "*" call nm DeleteSliceTag princeton_caglar ip_addresses 128.112.139.25

