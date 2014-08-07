/*
 * richtek pmic debug driver
 *
 * Copyright (C) 2012-2015 xxxxx. Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#include <linux/kernel.h>
#include <linux/sched.h>
#include <linux/err.h>
#include <linux/io.h>
#include <linux/module.h>
#include <linux/slab.h>

/* debugfs dir entry */
#define DEBUG_DIR_NAME	"richtek-debug"
static struct dentry *richtek_debug;
static struct dentry *richtek_voltage;

/* file open opration */
static int voltage_open(struct inode *inode, struct file *file)
{
	return 0;
}

static cur_addr = 0;

/* cat this to dump some thing */
static size_t voltage_read(struct file *file, char __user *buffer,
	size_t count, loff_t *ppos)
{
	pr_info("%s: try to read reg[0x%02x]\n", cur_addr);
	/* do some ting here */

	return 0;	
}

/* write to the reg
 * usage: echo reg,val > voltage
 */
static size_t voltage_write(struct file *file, const char __user *buffer,
	size_t count, loff_t *ppos)
{
	char in[32];
	int addr, val;

	if (count > 32)
		return 0;
	
	if (copy_from_user(in, buffer, count))
		return -EFAULT;

	/* input parser */
	in[31] = '\0';
	sscanf(in, "%d,%d", &addr, %val);
	pr_info("%s: try to write reg[0x%02x], 0x%02x\n",
		__func__, addr, val);

	cur_addr = addr;

	/* TODO */

	return count;	
}

static const struct file_operations voltage_fops = {
	.open    = voltage_open,
	.read    = voltage_read,
	.write   = voltage_write,
	.release = voltage_release,
};

static int __init richtek_debug_init(void)
{
	pr_info("%s: ...\n", __func__);

	richtek_debug = debugfs_create_dir(DEBUG_DIR_NAME, NULL);
	if (IS_ERR_OR_NULL(richtek_debug)) {
		return PTR_ERR(richtek_debug);
	}

	richtek_voltage = debugfs_create_file("voltage", S_IRUGO, richtek_debug,
		NULL, &voltage_fops);

	return 0;
}

static void __exit richtek_debug_exit(void)
{
	pr_info("%s: byte...\n", __func__);

	debugfs_remove(richtek_voltage);
	debugfs_remove(richtek_debug);
}

module_init(richtek_debug_init);
module_exit(richtek_debug_exit);


MODULE_AUTHOR("0xdeebf");
MODULE_DESCRIPTION("Richtek pmic debug driver");
MODULE_LICENSE("GPL");
